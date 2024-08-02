import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/design_system/theme/insets.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:flutter/material.dart';

class CaffeioBottomContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  const CaffeioBottomContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(CaffeioSpacing.l),
          topLeft: Radius.circular(CaffeioSpacing.l),
        ),
        color: backgroundColor ?? theme.palette.blueScale.primaryColor,
      ),
      padding: CaffeioInsets.xs.toHorizontal,
      child: child,
    );
  }
}
