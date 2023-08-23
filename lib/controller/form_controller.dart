import 'package:flutter/material.dart';


/// A class for managing state and text editing controllers related to tooltip settings form.
class ToolTipFormState extends ChangeNotifier {
  final TextEditingController tipTextController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController paddingController = TextEditingController();
  final TextEditingController textColorController = TextEditingController();
  final TextEditingController backgroundColorController = TextEditingController();
  final TextEditingController tipRadiusController = TextEditingController();
  final TextEditingController tipWidthController = TextEditingController();
  final TextEditingController arrowWidthController = TextEditingController();
  final TextEditingController arrowHeightController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    tipTextController.dispose();
    sizeController.dispose();
    paddingController.dispose();
    textColorController.dispose();
    backgroundColorController.dispose();
    tipRadiusController.dispose();
    tipWidthController.dispose();
    arrowWidthController.dispose();
    arrowHeightController.dispose();
  }
}
