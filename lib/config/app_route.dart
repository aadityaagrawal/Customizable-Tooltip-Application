import 'package:flutter/material.dart';
import '../screen/screens.dart';

class AppRoutes {
  static const String home = '/';
  static const String addTip = '/addTip';
  static const String splash = '/splash';
  static const String editTip = '/editTip';
  static const String updateTip = '/updateTip';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    addTip: (context) => const ToolTipForm(),
    editTip: (context) => const ToolTipEdit(),
    splash: (context) => const SplashScreen(),
    updateTip: (context) => const ToolTipForm(
          isUpdateTip: true,
        )
  };
}
