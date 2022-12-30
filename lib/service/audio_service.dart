import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class QueueState {
  const QueueState(
    this.queue,
    this.queueIndex,
    this.shuffleIndices,
    this.repeatMode,
  );

  static const QueueState empty =
      QueueState([], 0, [], AudioServiceRepeatMode.none);

  final List<MediaItem> queue;
  final int? queueIndex;
  final List<int>? shuffleIndices;
  final AudioServiceRepeatMode repeatMode;

  bool get hasPrevious =>
      repeatMode != AudioServiceRepeatMode.none || (queueIndex ?? 0) > 0;

  bool get hasNext =>
      repeatMode != AudioServiceRepeatMode.none ||
      (queueIndex ?? 0) + 1 < queue.length;

  List<int> get indices =>
      shuffleIndices ?? List.generate(queue.length, (i) => i);
}

/// [AudioPlayerHandler]
abstract class AudioPlayerHandler implements AudioHandler {
  Stream<QueueState> get queueState;

  Future<void> moveQueueItem(int currentIndex, int newIndex);

  ValueStream<double> get volume;

  Future<void> setVolume(double volume);

  ValueStream<double> get speed;
}

class AudioServiceImpl extends BaseAudioHandler implements AudioPlayerHandler {
  AudioServiceImpl() {
    _init();
  }

  AndroidEqualizerParameters? equalizerParameters;
  final _equalizer = AndroidEqualizer();
  Timer? _sleepTimer;
  bool loadStart = true;
  AudioPlayer? _audioPlayer;

  bool? resetOnSkip;

  Timer? _timer;
  late BehaviorSubject<int> _tappedMediaActionNumber;

  //Box downloadsBox = Hive.box('downloads');

  @override
  final BehaviorSubject<double> volume = BehaviorSubject.seeded(1);

  @override
  final BehaviorSubject<double> speed = BehaviorSubject.seeded(1);

  final BehaviorSubject<List<MediaItem>> _recentSubject =
      BehaviorSubject.seeded(<MediaItem>[
    MediaItem(
      id: '1',
      title: 'Hello',
      artUri: Uri.parse(
        'file://android//app//src//main//res//mipmap-xxhdpi',
      ),
      extras: {
        'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        'title': 'Play Audio Test',
      },
    )
  ]);

  final _playList = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
        Uri.parse(
            'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'),
      ),
    ],
  );

  int? getQueueIndex(int? currentIndex, List<int> shuffleIndices) {
    return 0;
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    await startService();

    _audioPlayer!.playbackEventStream.listen(_broadcastState);

    await _audioPlayer!.setAudioSource(
      _playList,
    );
  }

  Future<void> startService() async {
    if (Platform.isAndroid) {
      final pipeline = AudioPipeline(
        androidAudioEffects: [
          _equalizer,
        ],
      );
      _audioPlayer = AudioPlayer(
        audioPipeline: pipeline,
      );
    } else {}
  }

  /// Handle Action Click Play/Pause
  /// Delay time 400 milliseconds to avoid user click many time in
  /// Tap Number: [1]: Play/Pause [2]: Skip To Next [3]: Skip To Previous
  void handleMediaAction() {
    if (_timer == null) {
      _tappedMediaActionNumber = BehaviorSubject.seeded(1);
      _timer = Timer(const Duration(milliseconds: 400), () {
        final tappedNumber = _tappedMediaActionNumber.value;
        switch (tappedNumber) {
          case 1:
            print('handleMediaAction ${playbackState.value.playing}');
            if (playbackState.value.playing) {
              pause();
            } else {
              play();
            }
            break;
          default:
            break;
        }
        _tappedMediaActionNumber.close();
        _timer!.cancel();
        _timer = null;
      });
    } else {
      final current = _tappedMediaActionNumber.value;
      _tappedMediaActionNumber.add(current + 1);
    }
  }

  void _broadcastState(PlaybackEvent event) {
    final isPlaying = _audioPlayer!.playing;

    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (isPlaying) MediaControl.pause else MediaControl.play,
          MediaControl.skipToNext,
          MediaControl.stop,
        ],
        systemActions: {
          MediaAction.seek,
          MediaAction.seekForward,
          MediaAction.seekBackward,
        },
        androidCompactActionIndices: const [0, 1, 2],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_audioPlayer!.processingState]!,
        playing: isPlaying,
        updatePosition: _audioPlayer!.position,
        bufferedPosition: _audioPlayer!.bufferedPosition,
        speed: _audioPlayer!.speed,
        // queueIndex: queueIndex,
      ),
    );
  }

  @override
  Future<void> play() => _audioPlayer!.play();

  @override
  Future<void> seek(Duration position) => _audioPlayer!.seek(position);

  @override
  Future<List<MediaItem>> getChildren(
    String parentMediaId, [
    Map<String, dynamic>? options,
  ]) async {
    print('Get Children');
    return _recentSubject.value;
    // switch (parentMediaId) {
    //   case AudioService.recentRootId:
    //     return _recentSubject.value;
    //   default:
    //     return queue.value;
    // }
  }

  @override
  ValueStream<Map<String, dynamic>> subscribeToChildren(String parentMediaId) {
    final stream = _recentSubject.map((_) => <String, dynamic>{});
    return _recentSubject.hasValue
        ? stream.shareValueSeeded(<String, dynamic>{})
        : stream.shareValue();
  }

  @override
  Future<void> stop() async {
    await _audioPlayer?.stop();
    // Cache Index
  }

  @override
  Future<void> pause() async {
    await _audioPlayer?.pause();
  }

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) async {
    playbackState.add(playbackState.value.copyWith(repeatMode: repeatMode));
    await _audioPlayer!.setLoopMode(LoopMode.values[repeatMode.index]);
  }

  @override
  Future<void> setSpeed(double speed) async {
    this.speed.add(speed);
    await _audioPlayer!.setSpeed(speed);
  }

  void dispose() {
    _recentSubject.close();
    volume.close();
    speed.close();
  }

  @override
  Future<void> moveQueueItem(int currentIndex, int newIndex) async {}

  @override
  Stream<QueueState> get queueState => throw UnimplementedError();

  @override
  Future<void> setVolume(double volume) async {}
}
