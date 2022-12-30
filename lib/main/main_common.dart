import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../app.dart';
import '../data/provider/app_flavor_provider.dart';
import '../service/audio_service.dart';
import 'app_flavor.dart';

Future<void> startService() async {
  final audioHandler = await AudioService.init(
    builder: () => AudioServiceImpl(),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'com.shadow.blackhole.channel.audio',
      androidNotificationChannelName: 'BlackHole',
      androidNotificationOngoing: true,
      androidNotificationIcon: 'drawable/ic_stat_music_note',
      androidShowNotificationBadge: true,
      notificationColor: Colors.grey[900],
      preloadArtwork: true,
    ),
  );
  GetIt.I.registerSingleton<AudioServiceImpl>(audioHandler);
}

Future<void> mainCommon(AppFlavor appFlavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  Future<void> startApp() async {
    await Firebase.initializeApp();

    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      // Handle Crashlytics enabled status when not in Debug,
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
  }

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await Hive.initFlutter('BlackHole');
  } else {
    await Hive.initFlutter();
  }

  // await openHiveBox('settings');

  await startService();

  await startApp();

  runApp(
    ProviderScope(
      overrides: [
        appFlavorProvider.overrideWithValue(appFlavor),
      ],
      child: App(
        appFlavor: appFlavor,
      ),
    ),
  );
}
