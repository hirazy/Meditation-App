import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required int index,
    required String sessionDay,
    required bool isExpandedAppBar,
    VideoPlayerController? controller,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        index: 0,
        isExpandedAppBar: false,
        sessionDay: '',
        controller: null,
      );
}
