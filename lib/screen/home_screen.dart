import 'package:flutter/material.dart';
import 'package:trektip/config/app_data.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/model/tip_model.dart';
import 'package:trektip/widget/home_screen_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppData appData = AppData();
  List<TipModel> tripModel = [];
  List<List<Widget>> widgetLists = [];
  int currentIndex = 0;

  Future<void> loadData() async {
    tripModel = await DbController().getData();
    addWidgetToCurrentList(tripModel);
  }

  void addWidgetToCurrentList(List<TipModel> tipData) {
    for (int i = 0; i < AppData().numberOfBoxes; i++) {
      if (widgetLists.length <= currentIndex) {
        // print(tipData);
        widgetLists.add([CustomButton(tipData: tipData, index: i)]);
      } else if (widgetLists[currentIndex].length < 2) {
        widgetLists[currentIndex].add(CustomButton(tipData: tipData, index: i));
      } else {
        currentIndex++;
        widgetLists.add([CustomButton(tipData: tipData, index: i)]);
        currentIndex++;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              Navigator.pushNamed(context, "/editTip");
            },
          ),
        ),
        body: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text("The data cannot be loaded"));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widgetLists.asMap().entries.map((entry) {
                      final rowIndex = entry.key;
                      final rowWidgets = entry.value;
                      MainAxisAlignment mainAxisAlignment = rowIndex.isEven
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center;
                      return Row(
                        mainAxisAlignment: mainAxisAlignment,
                        children: rowWidgets,
                      );
                    }).toList(),
                  ),
                );
              }
            }));
  }
}
