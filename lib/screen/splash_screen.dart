import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trektip/config/app_data.dart';
import 'package:trektip/model/tip_model.dart';
import '../controller/db_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppData appData = AppData();
  late List<TipModel> tipDetails;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(Duration(seconds: appData.splashWaitTime));

    tipDetails = await DbController().getData();
    if (tipDetails.isEmpty) {
      /// Will directly take us to addTip page in case the user does not added any tooltip information
      Navigator.pushReplacementNamed(context, "/addTip");
    } else {
      /// Will directly take us to home screen page in case the user is added any tooltip info
      Navigator.pushReplacementNamed(context, "/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.newtonCradle(
          color: Theme.of(context).primaryColor,
          size: 200,
        ),
      ),
    );
  }
}
