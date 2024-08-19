import 'package:flutter/material.dart';

extension CustomThemeData on ThemeData {
  Gradient get customGradient => LinearGradient(
        colors: [Color(0xffF49EC4), Color(0xffF9C0C7)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
