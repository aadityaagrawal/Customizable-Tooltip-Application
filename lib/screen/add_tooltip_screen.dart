import 'package:flutter/material.dart';
import 'package:trektip/config/app_data.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/controller/form_controller.dart';
import 'package:trektip/model/tip_model.dart';
import 'package:trektip/widget/action_button_widget.dart';
import '../widget/text_field_widget.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class ToolTipForm extends StatefulWidget {
  final bool isUpdateTip;
  final TipModel? tipModel;
  const ToolTipForm({this.isUpdateTip = false, super.key, this.tipModel});

  @override
  State<ToolTipForm> createState() => _ToolTipFormState();
}

class _ToolTipFormState extends State<ToolTipForm> {
  List<Color?> dialogPickerColor = [null, null];
  final _formKey = GlobalKey<FormState>();
  int n = 5;
  List<String> dropdownOptions =
      List.generate(AppData().numberOfBoxes, (index) => 'Button ${index + 1}');
  String? selectedOption;
  late ToolTipFormState _formState;

  dynamic dropdownValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please select a target element';
    }
    return null;
  }

  TipModel insertData(ToolTipFormState formState) {
    return TipModel(
      targetElement: selectedOption!,
      toolTipText: formState.tipTextController.text,
      textSize: int.parse(formState.sizeController.text),
      textPadding: int.parse(formState.paddingController.text),
      textColor: formState.textColorController.text,
      backgroundColor: formState.backgroundColorController.text,
      cornerRadius: int.parse(formState.tipRadiusController.text),
      tooltipWidth: int.parse(formState.tipWidthController.text),
      arrowWidth: int.parse(formState.arrowWidthController.text),
      arrowHeight: int.parse(formState.arrowHeightController.text),
    );
  }

  void showData(TipModel? tipModel) {
    if (tipModel != null) {
      selectedOption = tipModel.targetElement;
      _formState.tipTextController.text = tipModel.toolTipText;
      _formState.sizeController.text = tipModel.textSize.toString();
      _formState.paddingController.text = tipModel.textPadding.toString();
      _formState.textColorController.text = tipModel.textColor;
      _formState.backgroundColorController.text = tipModel.backgroundColor;
      _formState.tipRadiusController.text = tipModel.cornerRadius.toString();
      _formState.tipWidthController.text = tipModel.tooltipWidth.toString();
      _formState.arrowWidthController.text = tipModel.arrowWidth.toString();
      _formState.arrowHeightController.text = tipModel.arrowHeight.toString();
      dialogPickerColor[0] = Color(int.parse('0x${tipModel.textColor}'));
      dialogPickerColor[1] = Color(int.parse('0x${tipModel.backgroundColor}'));
    }
  }

  Future<bool> colorPickerDialog(
      TextEditingController controller, int index) async {
    return ColorPicker(
        pickersEnabled: const {
          ColorPickerType.accent: false,
        },
        heading: const Text("Select color"),
        subheading: const Text("Select color shades"),
        width: 40,
        height: 40,
        spacing: 5,
        runSpacing: 5,
        color: dialogPickerColor[index] ?? Colors.transparent,
        onColorChanged: (Color color) {
          setState(() {
            dialogPickerColor[index] = color;
            controller.text = ColorTools.colorCode(dialogPickerColor[index]!);
            if (AppData().printBool) {
              print(controller.text);
            }
          });
        }).showPickerDialog(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formState = ToolTipFormState();
    if (widget.tipModel != null) showData(widget.tipModel);
  }

  @override
  void dispose() {
    _formState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text("Tooltip Form"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Target Element"),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: DropdownButtonFormField<String>(
                        hint: const Text("Choose the button"),
                        value: selectedOption,
                        items: dropdownOptions.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          return dropdownValidator(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Tooltip Text'),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFromField(
                        textController: _formState.tipTextController,
                        hintText: "Input")
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Text Size'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFromField(
                            textController: _formState.sizeController,
                            hintText: "10")
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Padding'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFromField(
                            textController: _formState.paddingController,
                            hintText: "10")
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Text Color'),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onTap: () async {
                        final Color beforeSelectedColor =
                            dialogPickerColor[0] ?? Colors.transparent;

                        if (!(await colorPickerDialog(
                            _formState.textColorController, 0))) {
                          setState(() {
                            dialogPickerColor[0] = beforeSelectedColor;
                          });
                        }
                      },
                      title: dialogPickerColor[0] != null
                          ? Text(
                              ColorTools.nameThatColor(dialogPickerColor[0]!))
                          : const Text("Choose color"),
                      trailing: ColorIndicator(
                        width: 30,
                        height: 30,
                        borderRadius: 4,
                        color: dialogPickerColor[0] ?? Colors.transparent,
                        // onSelectFocus: false,
                        onSelect: () async {
                          final Color beforeSelectedColor =
                              dialogPickerColor[0] ?? Colors.transparent;
                          if (!(await colorPickerDialog(
                              _formState.textColorController, 0))) {
                            setState(() {
                              dialogPickerColor[0] = beforeSelectedColor;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Background Color'),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onTap: () async {
                        final Color beforeSelectedColor =
                            dialogPickerColor[1] ?? Colors.transparent;

                        if (!(await colorPickerDialog(
                            _formState.backgroundColorController, 1))) {
                          setState(() {
                            dialogPickerColor[1] = beforeSelectedColor;
                          });
                        }
                      },
                      title: dialogPickerColor[1] != null
                          ? Text(
                              ColorTools.nameThatColor(dialogPickerColor[1]!))
                          : const Text("Choose color"),
                      trailing: ColorIndicator(
                        width: 30,
                        height: 30,
                        borderRadius: 4,
                        color: dialogPickerColor[1] ?? Colors.transparent,
                        onSelect: () async {
                          final Color beforeSelectedColor =
                              dialogPickerColor[1] ?? Colors.transparent;
                          if (!(await colorPickerDialog(
                              _formState.backgroundColorController, 1))) {
                            setState(() {
                              dialogPickerColor[1] = beforeSelectedColor;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Corner radius'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFromField(
                            textController: _formState.tipRadiusController,
                            hintText: "10")
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Tooltip width'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFromField(
                            textController: _formState.tipWidthController,
                            hintText: "10")
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Arrow width'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFromField(
                            textController: _formState.arrowWidthController,
                            hintText: "10")
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Arrow height'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFromField(
                            textController: _formState.arrowHeightController,
                            hintText: "10")
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                widget.isUpdateTip
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionButtons(
                            onTap: () {
                              DbController().deleteData(widget.tipModel!.id!);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Tooltip deleted successfully")));
                              Navigator.pop(context, true);
                            },
                            buttonColor: Colors.red,
                            buttonText: "Delete",
                          ),
                          ActionButtons(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                DbController().updateTooltipSettings(
                                    insertData(_formState),
                                    widget.tipModel!.id!);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Tooltip updated successfully")));
                                Navigator.pop(context, true);
                              }
                            },
                            buttonColor: Theme.of(context).primaryColor,
                            buttonText: "Update",
                          ),
                        ],
                      )
                    : Center(
                        child: ActionButtons(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                DbController()
                                    .insertData(insertData(_formState));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Tooltip added successfully")));
                                setState(() {});
                                Navigator.pop(context, true);
                              }
                            },
                            buttonColor: Theme.of(context).primaryColor,
                            buttonText: "Render Tooltip"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
