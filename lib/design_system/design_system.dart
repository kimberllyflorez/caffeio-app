import 'package:caffeio/design_system/theme/colors.dart';
import 'package:caffeio/design_system/theme/insets.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:caffeio/design_system/typo/typo.dart';
import 'package:flutter/material.dart';

extension Theme on BuildContext {
  CaffeioTheme get theme => CaffeioTheme();
}

class CaffeioTheme {
  Spacing get spacing => const Spacing();

  Palette get palette => const Palette();

  Typo get typo => const Typo();

  Insets get insets => const Insets();
}
