import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CaffeioButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CaffeioButton({
    Key? key,
    required this.callback,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(
        text,
        style: context.theme.typo.button,
      ),
    );
  }
}
