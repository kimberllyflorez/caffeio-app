import 'dart:ui';

class Palette {
  const Palette();

  final grayScale = const GrayScale();

  final blueScale = const BlueScale();

  final yellowScale = const YellowScale();

  final brownScale = const BrownScale();
}

class GrayScale {
  const GrayScale();

  Color get gray => const Color(0xffd6dbdf);

  Color get white => const Color(0xFFFFFFFF);
}

class BlueScale {
  const BlueScale();

  Color get primaryColor => const Color(0xFF00A096);
}

class YellowScale {
  const YellowScale();

  Color get secondaryColor => const Color(0xFFFF6A00);

  Color get accentColor => const Color(0xFFFFFF00);
}

class BrownScale {
  const BrownScale();

  Color get primaryColor => const Color(0xFF652714);
}
