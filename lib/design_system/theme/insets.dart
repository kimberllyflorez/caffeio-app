import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:flutter/cupertino.dart';

class CaffeioInsets {
  const CaffeioInsets();

  static CaffeioEdgeInsets none = const CaffeioEdgeInsets(CaffeioSpacing.none);
  static CaffeioEdgeInsets xxs = const CaffeioEdgeInsets(CaffeioSpacing.xxs);
  static CaffeioEdgeInsets xs = const CaffeioEdgeInsets(CaffeioSpacing.xs);
  static CaffeioEdgeInsets s = const CaffeioEdgeInsets(CaffeioSpacing.s);
  static CaffeioEdgeInsets m = const CaffeioEdgeInsets(CaffeioSpacing.m);
  static CaffeioEdgeInsets l = const CaffeioEdgeInsets(CaffeioSpacing.l);
  static CaffeioEdgeInsets xl = const CaffeioEdgeInsets(CaffeioSpacing.xl);
  static CaffeioEdgeInsets xxl = const CaffeioEdgeInsets(CaffeioSpacing.xxl);
}

class CaffeioEdgeInsets extends EdgeInsets {
  final double size;

  const CaffeioEdgeInsets(this.size) : super.all(size);

  EdgeInsets get all => EdgeInsets.all(size);

  EdgeInsets get toHorizontal => EdgeInsets.symmetric(horizontal: size);

  EdgeInsets get toVertical => EdgeInsets.symmetric(vertical: size);

  EdgeInsets get toTop => EdgeInsets.only(top: size);

  EdgeInsets get toRight => EdgeInsets.only(right: size);

  EdgeInsets get toLeft => EdgeInsets.only(left: size);

  EdgeInsets get toBottom => EdgeInsets.only(bottom: size);

  EdgeInsets get toLRB => EdgeInsets.fromLTRB(size, 0.0, size, size);

  EdgeInsets get toTRB => EdgeInsets.fromLTRB(size, size, size, 0.0);
}
