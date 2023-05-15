import 'package:caffeio/design_system/theme/colors.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:caffeio/design_system/typo/typo.dart';
import 'package:flutter/material.dart';

extension Theme on BuildContext {
  CaffeioTheme get theme => CaffeioTheme();
}

class CaffeioTheme {
  Spacing get spacing => Spacing();

  Palette get palette => const Palette();

  Typo get typo => Typo();
}
