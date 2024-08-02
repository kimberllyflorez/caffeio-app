import 'package:caffeio/design_system/theme/insets.dart';
import 'package:flutter/material.dart';

class CaffeioCircularButton extends StatelessWidget {
  final VoidCallback callback;
  final Widget child;

  const CaffeioCircularButton({
    super.key,
    required this.callback,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        elevation: 2,
        shadowColor: Colors.grey,
        padding: CaffeioInsets.xs,
      ),
      child: child,
    );
  }
}
