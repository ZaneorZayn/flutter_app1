import 'package:flutter/material.dart';

extension CustomThemeData on ThemeData {
  Gradient get customGradient => LinearGradient(
        colors: [Color(0xFFF49EC4), Color(0xFFF9C0C7)],
    begin: Alignment(-1, 0.09),
    end: Alignment(1.00, -0.09),
      );
}
