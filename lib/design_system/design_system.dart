import 'package:caffeio/design_system/theme/colors.dart';
import 'package:caffeio/design_system/typo/typo.dart';
import 'package:flutter/material.dart';

extension AppTheme on BuildContext {
  CaffeioTheme get theme => CaffeioTheme();
}

class CaffeioTheme {
  Palette get palette => const Palette();

  Typo get typo => const Typo();
}
