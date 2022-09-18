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
    this.textCapitalization = TextCapitalization.none,
    this.textInputType,
    this.isCounterText = true,
    this.isDanger = false,
    this.maxLength = 99,
    this.textInputAction = TextInputAction.done,
    this.closeKeyboardStream,
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

  /// TextCapitalization default `TextCapitalization.none`
  final TextCapitalization textCapitalization;

  /// Text Input Type for Key board
  final TextInputType? textInputType;

  /// Dangerous - Error Text
  final bool isDanger;

  /// Counter Text is enabled or not
  final bool isCounterText;

  /// Text Input Action
  final TextInputAction textInputAction;

  /// Listen Event close Keyboard
  final Stream? closeKeyboardStream;

  @override
  InputTextAreaState createState() => InputTextAreaState();
}

class InputTextAreaState extends State<InputTextArea> {
  bool get _isDangerous => widget.errorText != null;

  @override
  Widget build(BuildContext context) {
    final contents = <Widget>[];

    if (widget.title != null) {
      contents.addAll(
        [
          const SpaceBox.height(),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title!,
              textAlign: TextAlign.left,
            ),
          )
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Align(
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
                ),
              ],
            ),
          ),
        ),
        const SpaceBox.height(),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: TextFormField(
            initialValue: widget.initialText,
            onChanged: widget.onChanged,
            controller: widget.controller,
            maxLength: widget.maxLength,
            obscureText: widget.obSecureText,
            obscuringCharacter: '●',
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
              counterText: widget.isCounterText ? '' : null,
            ),
            textAlign: widget.textAlign ?? TextAlign.left,
          ),
        ),
        if (_isDangerous)
          Container(
            margin: const EdgeInsets.only(
              top: 5,
              left: 15,
            ),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
      ],
    );
  }
}
