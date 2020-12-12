import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class TestFlutterColors {

  static final blue =Color(0xff3F90F6);
  static final orange =Color(0xffED8306);
  // static final dark = Color(0xFF03091e);
  static final dark = Color(0xFF000000);
  static final white = Color(0xFFffffff);
  static final grey = Color(0xFF7a7a7a);
  static final title = Color(0xFF404040);

}

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: TestFlutterColors.blue,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline6: TextStyle(
        fontSize: 20,
        color: TestFlutterColors.white,
        fontWeight: FontWeight.bold
      )
    )
  ),
  accentTextTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: TestFlutterColors.dark,
      displayColor: TestFlutterColors.dark,
    ),
  textTheme: GoogleFonts.robotoTextTheme().apply(
      bodyColor: TestFlutterColors.grey,
      displayColor: TestFlutterColors.grey,
    ),
  );
  



