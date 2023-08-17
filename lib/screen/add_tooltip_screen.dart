import 'package:flutter/material.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/model/tip_model.dart';

class ToolTipForm extends StatefulWidget {
  const ToolTipForm({super.key});

  @override
  State<ToolTipForm> createState() => _ToolTipFormState();
}

class _ToolTipFormState extends State<ToolTipForm> {
  void insertData() {
    final TipModel sampleTip = TipModel(
      toolTipText: "Sample Tip Text",
      textSize: 16,
      textPadding: 10,
      textColor: "#000000",
      backgroundColor: "#FFFFFF",
      cornerRadius: 8,
      tooltipWidth: 200,
      arrowWidth: 10,
      arrowHeight: 20,
    );

    DbController().insertData(sampleTip);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    insertData();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      color: Colors.red,
    );
  }
}
