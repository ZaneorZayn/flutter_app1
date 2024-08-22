import 'package:flutter/material.dart';
import 'package:mobile_app/core/splash_screen.dart';
import 'package:mobile_app/core/themedata.dart';
import 'package:mobile_app/screen/homescreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myCustomTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

