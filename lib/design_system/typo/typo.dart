import 'package:flutter/material.dart';

class Typo {
  const Typo();

  TextStyle get title => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );

  TextStyle get subtitle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  TextStyle get button => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );
}
