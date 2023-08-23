import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData AppTheme() {
  return ThemeData(
      fontFamily: 'Barlow',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0XFF673ab7),
      textTheme: const TextTheme(
          displayMedium: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)));
}
