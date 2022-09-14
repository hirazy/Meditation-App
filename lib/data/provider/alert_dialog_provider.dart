import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/alert_dialog/common_alert_dialog.dart';
import 'app_navigator_provider.dart';

final alertDialogProvider = Provider<AlertDialogProvider>(
  (ref) => AlertDialogProvider(read: ref.read),
);

class AlertDialogProvider {
  const AlertDialogProvider({required this.read});

  final Reader read;

  Future<void> showAlertDialog({
    required String title,
    required String message,
    final VoidCallback? onPositiveButtonTap,
    final VoidCallback? onNegativeButtonTap,
  }) async {
    final currentContext =
        read(appNavigatorProvider).navigatorKey.currentContext;

    await showDialog(
      context: currentContext!,
      builder: (context) {
        return const CommonAlertDialog(
          title: '',
          message: '',
        );
      },
    );
  }
}
