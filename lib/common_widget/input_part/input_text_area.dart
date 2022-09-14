import 'package:flutter/material.dart';

import '../space_box.dart';

/// [InputTextArea] is base of edit text
class InputTextArea extends StatefulWidget {
  const InputTextArea({
    Key? key,
    this.title,
    this.secondTitle,
    this.initialText = '',
    this.hintText,
    this.onChanged,
    this.errorText,
    this.controller,
    this.textAlign = TextAlign.left,
    this.obSecureText = false,
    this.isDanger = false,
    this.maxLength = 99,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  /// Title of text area
  final String? title;

  /// Second Title of text area
  final String? secondTitle;

  /// Initial of text area
  final String? initialText;

  /// Hint Text
  final String? hintText;

  /// Error Text
  final String? errorText;

  /// Controller
  final TextEditingController? controller;

  /// Text has been changed
  final ValueChanged<String>? onChanged;

  /// Text Align
  final TextAlign? textAlign;

  /// Max Length
  final int? maxLength;

  /// Secure Text
  final bool obSecureText;

  /// Dangerous - Error Text
  final bool isDanger;

  /// Text Input Action
  final TextInputAction textInputAction;

  @override
  InputTextAreaState createState() => InputTextAreaState();
}

class InputTextAreaState extends State<InputTextArea> {
  bool get _isDangerous => widget.errorText != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                widget.title ?? '',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                widget.secondTitle ?? '',
                style: const TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        const SpaceBox.height(),
        Container(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            initialValue: widget.initialText,
            onChanged: widget.onChanged,
            controller: widget.controller,
            maxLength: widget.maxLength,
            obscureText: widget.obSecureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
            textAlign: widget.textAlign ?? TextAlign.left,
          ),
        ),
        if (_isDangerous)
          Text(
            widget.errorText!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
