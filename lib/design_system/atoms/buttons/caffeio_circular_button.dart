import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CaffeioCircularButton extends StatelessWidget {
  final VoidCallback callback;
  final Widget child;

  const CaffeioCircularButton({
    Key? key,
    required this.callback,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        elevation: 2,
        shadowColor: Colors.grey,
        padding: context.theme.insets.xs,
      ),
      child: child,
    );
  }
}
