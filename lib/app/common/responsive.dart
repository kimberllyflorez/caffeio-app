import 'package:flutter/material.dart';
import 'dart:math' as math;

extension Responsive on BuildContext {
  ResponsiveSize get responsive => ResponsiveSize(this);
}

class ResponsiveSize {
  double? _width, _height, _diagonal;
  bool? _isTablet;

  double? get width => _width;

  double? get height => _height;

  double? get diagonal => _diagonal;

  bool? get isTablet => _isTablet;

  final double _smallWidth = 320;
  final double _mediumWidth = 400;

  static ResponsiveSize of(BuildContext context) => ResponsiveSize(context);

  ResponsiveSize(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;

    // c2+ a2+b2 => c = srt(a2+b2)
    _diagonal = math.sqrt(math.pow(_width!, 2) + math.pow(_height!, 2));

    _isTablet = size.shortestSide >= 600;
  }

  double widthPercent(double percent) => _width! * percent / 100;

  double heightPercent(double percent) => _height! * percent / 100;

  double diagonalPercent(double percent) => _diagonal! * percent / 100;

  double getFontSizeByDeviceWidth(double fontSize) {
    double smallFontSize = 10;
    double mediumFontSize = 12;
    double width = _width ?? 0.0;
    if (width <= _smallWidth) return smallFontSize;
    if (width > _smallWidth && width < _mediumWidth) {
      return fontSize.clamp(smallFontSize, mediumFontSize);
    }
    return fontSize;
  }
}
