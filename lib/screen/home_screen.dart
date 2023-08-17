import 'package:flutter/material.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/model/tip_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void printQuery() async {
    List<TipModel> data = await DbController().getData();
    print(data.first.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    printQuery();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.yellow,
      child: Text("You are in home screen"),
    );
  }
}
