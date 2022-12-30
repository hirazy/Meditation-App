import 'dart:ui';

import 'package:permission_handler/permission_handler.dart';

class Utils {
  static Future<void> changeAudioFocusPermission({
    required Function(bool) changeIsUsingAudioState,
    required VoidCallback onError,
  }) async {
    final audioFocusPermission = await Permission.audio.status;
    if (audioFocusPermission.isGranted) {
      changeIsUsingAudioState(true);
    } else {
      changeIsUsingAudioState(false);
      final requestStatus = await Permission.audio.request();
      if (requestStatus.isPermanentlyDenied || requestStatus.isRestricted) {
        onError();
      }
    }
  }
}
