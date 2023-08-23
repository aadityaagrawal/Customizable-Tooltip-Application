import 'package:flutter/material.dart';
import 'package:trektip/config/app_route.dart';
import 'package:trektip/config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
    );
  }
}
