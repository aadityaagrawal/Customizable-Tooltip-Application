import 'package:flutter/material.dart';

class ToolTipEdit extends StatefulWidget {
  const ToolTipEdit({super.key});

  @override
  State<ToolTipEdit> createState() => _ToolTipEditState();
}

class _ToolTipEditState extends State<ToolTipEdit> {
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
            Container(
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
                onTap: () {
                  Navigator.pushNamed(context, '/updateTip');
                },
                title: const Text("Tooltip of Button 2"),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "/addTip");
                },
                titleAlignment: ListTileTitleAlignment.center,
                trailing: const Icon(
                  Icons.add_circle_outline_sharp,
                  color: Colors.white,
                ),
                title: const Text(
                  "Add a Tooltip",
                  style: TextStyle(color: Colors.white),
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
