import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData AppTheme() {
  return ThemeData(
    fontFamily: 'Barlow',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0XFF673ab7),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF673ab7),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0XFF673ab7),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          )));
}
