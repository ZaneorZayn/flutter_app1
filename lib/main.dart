import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/controller/provider/cart_provider.dart';
import 'package:mobile_app/controller/provider/favorite_provider.dart';
import 'package:mobile_app/core/splash_screen.dart';
import 'package:mobile_app/core/themedata.dart';
import 'package:mobile_app/screen/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ],
        child: MyApp(),
      ),
  );


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,child){
        return MaterialApp(
          theme: myCustomTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}

