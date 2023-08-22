import 'package:flutter/material.dart';
import 'package:trektip/config/app_data.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/model/tip_model.dart';
import 'package:trektip/screen/screens.dart';

class ToolTipEdit extends StatefulWidget {
  const ToolTipEdit({super.key});

  @override
  State<ToolTipEdit> createState() => _ToolTipEditState();
}

class _ToolTipEditState extends State<ToolTipEdit> {
  int lengthofDataAdded = 0;
  List<TipModel> savedTips = [];
  List<Widget> addedTipsList = [];

  List<Widget> addingTipTile() {
    return List.generate(lengthofDataAdded, (index) {
      return Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          trailing: const Icon(
            Icons.edit,
            color: Colors.black,
          ),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ToolTipForm(
                  isUpdateTip: true,
                  tipModel: savedTips[index],
                ),
              ),
            ).then((result) {
              if (result == true) {
                // Data was updated, refresh the screen
                setState(() {
                  // Add your logic to refresh the UI or data here
                  DbController().getData().then((value) {
                    setState(() {
                      savedTips = value;
                      savedTips.sort((a, b) =>
                                  a.targetElement.compareTo(b.targetElement));
                    });
                    lengthofDataAdded = savedTips.length;

                    addedTipsList = addingTipTile();
                  });
                });
              }
            });
            ;

            // Navigator.pushNamed(context, '/updateTip',
            //     arguments: savedTips[index]);
          },
          title: Text("Tooltip of ${(savedTips[index].targetElement)}"),
          contentPadding: const EdgeInsets.all(10),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DbController().getData().then((value) {
      setState(() {
        savedTips = value;
        savedTips.sort((a, b) => a.targetElement.compareTo(b.targetElement));
      });
      lengthofDataAdded = savedTips.length;
      addedTipsList = addingTipTile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tooltips details"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: addedTipsList,
            ),
            Container(
              decoration: BoxDecoration(
                  color: addedTipsList.length < AppData().numberOfBoxes
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () async {
                  if (addedTipsList.length < AppData().numberOfBoxes) {
                    Navigator.pushNamed(context, "/addTip").then((result) {
                      if (result == true) {
                        // Data was updated, refresh the screen
                        setState(() {
                          // Add your logic to refresh the UI or data here
                          DbController().getData().then((value) {
                            setState(() {
                              savedTips = value;
                              savedTips.sort((a, b) =>
                                  a.targetElement.compareTo(b.targetElement));
                            });
                            lengthofDataAdded = savedTips.length;

                            addedTipsList = addingTipTile();
                          });
                        });
                      }
                    });
                  }
                },
                titleAlignment: ListTileTitleAlignment.center,
                trailing: addedTipsList.length < AppData().numberOfBoxes
                    ? const Icon(
                        Icons.add_circle_outline_sharp,
                        color: Colors.white,
                      )
                    : null,
                title: addedTipsList.length < AppData().numberOfBoxes
                    ? const Text(
                        "Add a new Tooltip",
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        "You can only add upto ${AppData().numberOfBoxes}",
                        style: const TextStyle(color: Colors.white),
                      ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
