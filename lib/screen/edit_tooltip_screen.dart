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
  List<TipModel> savedTips = [];
  int lengthofDataAdded = 0;
  List<Widget> addedTipsList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DbController().getData().then((value) {
      setState(() {
        savedTips = value;
      });
      lengthofDataAdded = savedTips.length;

      addedTipsList = List.generate(lengthofDataAdded, (index) {
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
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ToolTipForm(
                    isUpdateTip: true,
                    tipModel: savedTips[index],
                  ),
                ),
              );

              if (result == true) {
                setState(() {});
              }

              // Navigator.pushNamed(context, '/updateTip',
              //     arguments: savedTips[index]);
            },
            title: Text("Tooltip of ${(savedTips[index].targetElement)}"),
            contentPadding: const EdgeInsets.all(10),
          ),
        );
      });
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
                    final result =
                        await Navigator.pushNamed(context, "/addTip");
                    if (result == true) {
                      setState(() {});
                    }
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
