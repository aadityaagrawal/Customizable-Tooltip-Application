import 'package:flutter/material.dart';
import 'package:trektip/config/app_data.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/model/tip_model.dart';
import 'package:trektip/widget/custom_tool_tip_home_screen_button.dart';

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
    resetWidgetLists();
    addWidgetToCurrentList(tripModel);
  }

  void resetWidgetLists() {
    widgetLists.clear();
    currentIndex = 0;
  }

  /// Code to show built tooltips

  // void addWidgetToCurrentList(List<TipModel> tipData) {
  //   for (int i = 0; i < AppData().numberOfBoxes; i++) {
  //     if (widgetLists.length <= currentIndex) {
  //       widgetLists.add([CustomButton(tipData: tipData, index: i)]);
  //     } else if (widgetLists[currentIndex].length < 2) {
  //       widgetLists[currentIndex].add(CustomButton(tipData: tipData, index: i));
  //     } else {
  //       currentIndex++;
  //       widgetLists.add([CustomButton(tipData: tipData, index: i)]);
  //       currentIndex++;
  //     }
  //   }
  // }

  /// Code to show customised tooltip
  ///
  /// To show the tooltip longpress on the button
  /// To exit the tooltip tap on the button
  void addWidgetToCurrentList(List<TipModel> tipData) {
    for (int i = 0; i < AppData().numberOfBoxes; i++) {
      if (widgetLists.length <= currentIndex) {
        widgetLists
            .add([CustomButtonForCustomToolTip(tipData: tipData, index: i)]);
      } else if (widgetLists[currentIndex].length < 2) {
        widgetLists[currentIndex]
            .add(CustomButtonForCustomToolTip(tipData: tipData, index: i));
      } else {
        currentIndex++;
        widgetLists
            .add([CustomButtonForCustomToolTip(tipData: tipData, index: i)]);
        currentIndex++;
      }
    }
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
            // only for custom widget
            setState(() {});
            Navigator.pushNamed(context, "/editTip").then((result) {
              if (result == true) {
                setState(() {
                  loadData();
                });
              }
            });
            ;
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
              color: Colors.black.withOpacity(0.25),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widgetLists.asMap().entries.map(
                  (entry) {
                    final rowIndex = entry.key;
                    final rowWidgets = entry.value;
                    MainAxisAlignment mainAxisAlignment = rowIndex.isEven
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center;
                    return Row(
                      mainAxisAlignment: mainAxisAlignment,
                      children: rowWidgets,
                    );
                  },
                ).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
