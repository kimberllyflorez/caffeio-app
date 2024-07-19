import 'package:flutter/material.dart';

class CaffeioField extends StatelessWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final String? label;
  final int? minLines;
  final int? maxLines;

  const CaffeioField({
    super.key,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.label,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      textAlign: textAlign,
      decoration: InputDecoration(
        label: label != null ? Text(label!) : null,
      ),
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
