import 'dart:ui';

class Palette {
  const Palette();

  GrayScale get grayScale => GrayScale();

  BlueScale get blueScale => BlueScale();

  YellowScale get yellowScale => YellowScale();

  PurpleScale get purpleScale => PurpleScale();
}

class GrayScale {
  static const gray200 = Color(0xffd6dbdf);
}

class BlueScale {
  static const blue200 = Color(0xff85c1e9);
}

class YellowScale {
  static const yellow = Color(0xfff7dc6f);
}

class PurpleScale {
  static const purple = Color(0xffebdef0);
}
