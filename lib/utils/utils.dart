import 'dart:io';
import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
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

  static Future<void> changStoragePermission({
    required Function(bool) changeStorageState,
    required VoidCallback onError,
  }) async {
    final storagePermission = await Permission.storage.status;
    if (storagePermission.isGranted) {
      changeStorageState(true);
    } else {
      changeStorageState(false);
      await [
        Permission.storage,
        Permission.accessMediaLocation,
        Permission.mediaLibrary,
      ].request();

      final status = await Permission.storage.status;
      if (status.isGranted) {
        changeStorageState(true);
      } else {
        onError();
      }
    }
  }

  Future<void> openHiveBox(
    String boxName, {
    bool isLimit = false,
  }) async {
    final box = await Hive.openBox(boxName).onError((error, stackTrace) async {
      final dir = await getApplicationDocumentsDirectory();
      final dirPath = dir.path;
      var dbFile = File('$dirPath/$boxName.hive');
      var lockFile = File('$dirPath/$boxName.lock');
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        dbFile = File('$dirPath/BlackHole/$boxName.hive');
        lockFile = File('$dirPath/BlackHole/$boxName.lock');
      }
      await dbFile.delete();
      await lockFile.delete();
      await Hive.openBox(boxName);
      throw Exception('Failed to open $boxName Box\nError: $error');
    });
    // clear box if it grows large
    if (isLimit && box.length > 500) {
      await box.clear();
    }
  }
}
