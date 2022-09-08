import 'package:flutter/material.dart';

/// [InputTextArea] is base of edit text
class InputTextArea extends StatefulWidget {
  const InputTextArea({
    Key? key,
    this.title,
    this.initialText = '',
    this.hintText,
    this.onChanged,
    this.errorText,
    this.controller,
  }) : super(key: key);

  /// Title of text area
  final String? title;

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

  @override
  InputTextAreaState createState() => InputTextAreaState();
}

class InputTextAreaState extends State<InputTextArea> {
  bool get _isDangerous => widget.errorText != null;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialText,
      onChanged: widget.onChanged,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
    );
  }
}
