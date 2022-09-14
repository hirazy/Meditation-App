import 'package:flutter/material.dart';

class CommonAlertDialog extends StatelessWidget {
  const CommonAlertDialog({
    required this.title,
    required this.message,
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositiveButtonTap,
    this.onNegativeButtonTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final String message;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final VoidCallback? onPositiveButtonTap;
  final VoidCallback? onNegativeButtonTap;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
