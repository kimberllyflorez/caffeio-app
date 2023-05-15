import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:flutter/cupertino.dart';

class Insets {
  Spacing get _spacing => const Spacing();

  const Insets();

  CaffeioEdgeInsets get none => CaffeioEdgeInsets(_spacing.none);

  CaffeioEdgeInsets get xxs => CaffeioEdgeInsets(_spacing.xxs);

  CaffeioEdgeInsets get xs => CaffeioEdgeInsets(_spacing.xs);

  CaffeioEdgeInsets get s => CaffeioEdgeInsets(_spacing.s);

  CaffeioEdgeInsets get m => CaffeioEdgeInsets(_spacing.m);

  CaffeioEdgeInsets get l => CaffeioEdgeInsets(_spacing.l);

  CaffeioEdgeInsets get xl => CaffeioEdgeInsets(_spacing.xl);

  CaffeioEdgeInsets get xxl => CaffeioEdgeInsets(_spacing.xxl);
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
