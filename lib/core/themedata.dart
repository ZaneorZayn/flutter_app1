import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myCustomTheme = ThemeData(

 colorScheme: const ColorScheme(
          primary: Color(0xffF39EC4),
          secondary: Color(0xff2DB1E5),
          error: Color(0xffFF2D55),
          surface: Color(0xffFFFFFF),
          onPrimary: Color(0xffFFD8DF),
          onSecondary: Color(0xff74D1F6),
          onSurface: Colors.black,
          onError: Color(0xff351238),
          inversePrimary: Color(0xff064B75),
          onInverseSurface: Color(0xff14697E),
          brightness: Brightness.light,
          
        ),

        textTheme:  TextTheme(
          displayLarge: GoogleFonts.nunito(
            fontSize: 18,
            fontWeight: FontWeight.bold,
           
          ),

          displayMedium:GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          color: Colors.black
          ),

          bodyLarge: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            
          ),

          bodyMedium: GoogleFonts.nunito(
            fontSize: 12.8,
            fontWeight: FontWeight.normal,
            
          ),

          titleLarge: GoogleFonts.nunito(
            fontSize: 10.24,
            fontWeight: FontWeight.normal,
          ),
        ),

          

        scaffoldBackgroundColor:Color(0xffFFFAFA),
);