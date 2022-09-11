import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/provider/app_flavor_provider.dart';
import '../main.dart';
import '../utils/firebase_options.dart';
import 'app_flavor.dart';

void mainCommon(AppFlavor appFlavor) {
  WidgetsFlutterBinding.ensureInitialized();

  Future<void> startApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (kDebugMode) {
      // Force disable Crashlytics collection while doing every day development.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      // Handle Crashlytics enabled status when not in Debug,
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
  }

  runApp(
    ProviderScope(
      overrides: [
        appFlavorProvider.overrideWithValue(appFlavor),
      ],
      child: const MyApp(),
    ),
  );
}
