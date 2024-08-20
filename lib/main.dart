import 'package:flutter/material.dart';
import 'package:mobile_app/core/themedata.dart';
import 'package:mobile_app/screen/homescreen.dart';
import 'package:mobile_app/screen/mainscreen.dart';
import 'package:provider/provider.dart';

import 'controller/provider/bottom_navigation.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myCustomTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

