import 'package:caffeio/design_system/colors.dart';
import 'package:caffeio/design_system/spacing.dart';
import 'package:caffeio/design_system/title.dart';
import 'package:flutter/material.dart';

extension Theme on BuildContext {
  CaffeioTheme get theme => CaffeioTheme();
}

class CaffeioTheme {
  Spacing get spacing => Spacing();

  Palette get palette => const Palette();

  Typo get typo => Typo();
}
