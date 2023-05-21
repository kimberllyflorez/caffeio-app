import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

class CaffeioBottomContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  const CaffeioBottomContainer({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(theme.spacing.l),
          topLeft: Radius.circular(theme.spacing.l),
        ),
        color: backgroundColor ?? theme.palette.blueScale.primaryColor,
      ),
      padding: theme.insets.xs.toHorizontal,
      child: child,
    );
  }
}
