import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CaffeioBottomContainer extends StatelessWidget {
  final Widget child;

  const CaffeioBottomContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(theme.spacing.l),
          topLeft: Radius.circular(theme.spacing.l),
        ),
        color: theme.palette.blueScale.primaryColor,
      ),
      padding: theme.insets.xs.toHorizontal,
      child: child,
    );
  }
}
