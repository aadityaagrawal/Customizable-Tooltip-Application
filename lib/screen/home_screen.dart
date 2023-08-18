import 'package:flutter/material.dart';
import 'package:trektip/config/app_data.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/model/tip_model.dart';
import 'package:trektip/widget/button_widget.dart';

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

  AppData appData = AppData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Text("TrekTip"),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, "/addTip");
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) {
                  return CustomButton(index: index);
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(1, (index) {
                  return CustomButton(index: index);
                }),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) {
                  return CustomButton(index: index);
                }),
              ),
            ],
          ),
        ));
  }
}
