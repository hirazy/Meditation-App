import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app.dart';
import '../data/provider/app_flavor_provider.dart';
import '../main.dart';
import 'app_flavor.dart';

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
