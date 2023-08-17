import 'package:flutter/material.dart';
import 'package:trektip/controller/controller.dart';

import '../model/model.dart';
import '../screen/screens.dart';

class AppRoutes {
  static const String home = '/';
  static const String addTip = '/addTip';
  static const String splash = '/splash';
  static const String editTip = '/editTip';
  static const String dbController = '/dbController';
  static const String tipModel = '/tipModel';


  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    addTip: (context) => const ToolTipForm(),
    editTip:(context) => const ToolTipEdit(),
    splash:(context) => const SplashScreen(),
    dbController:(context) => const DbContoller(),
    tipModel :(context) =>  const TipModel(),
  };
}
