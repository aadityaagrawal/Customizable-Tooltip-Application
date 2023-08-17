import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trektip/config/app_route.dart';
import 'package:trektip/config/app_theme.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

void main() {
  //Only in testing mode
  // if (Platform.isWindows || Platform.isLinux) {
  //   // Initialize FFI
  //   sqfliteFfiInit();
  // }
  // // Change the default factory. On iOS/Android, if not using `sqlite_flutter_lib` you can forget
  // // this step, it will use the sqlite version available on the system.
  // databaseFactory = databaseFactoryFfi;
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
    );
  }
}
