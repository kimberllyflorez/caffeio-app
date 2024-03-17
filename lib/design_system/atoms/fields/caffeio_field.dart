import 'package:flutter/material.dart';

class CaffeioField extends StatelessWidget {
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final String? label;
  final int? minLines;
  final int? maxLines;

  const CaffeioField({
    super.key,
    this.controller,
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
      controller: controller,
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
