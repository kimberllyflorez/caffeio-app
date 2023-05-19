import 'package:flutter/material.dart';

class Typo {
  const Typo();

  TextStyle get title => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subtitle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  TextStyle get body => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  TextStyle get button => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );
}
