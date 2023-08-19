import 'package:flutter/material.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/controller/form_controller.dart';
import 'package:trektip/model/tip_model.dart';
import 'package:trektip/widget/action_button_widget.dart';
import '../widget/text_field_widget.dart';

class ToolTipForm extends StatefulWidget {
  final bool isUpdateTip;
  const ToolTipForm({this.isUpdateTip = false, super.key});

  @override
  State<ToolTipForm> createState() => _ToolTipFormState();
}

class _ToolTipFormState extends State<ToolTipForm> {
  final _formKey = GlobalKey<FormState>();
  int n = 5;
  List<String> dropdownOptions =
      List.generate(5, (index) => 'Button ${index + 1}');
  String? selectedOption;
  late ToolTipFormState _formState;

  dynamic dropdownValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please select a target element';
    }
    return null;
  }

  TipModel insertData(ToolTipFormState formState) {
    // final TipModel tipData =

    return TipModel(
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
    // DbController().insertData(tipData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formState = ToolTipFormState();
    // insertData();
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
                    CustomTextFromField(
                        textController: _formState.textColorController,
                        hintText: "Input")
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
                    CustomTextFromField(
                        textController: _formState.backgroundColorController,
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
                              print("Delete function");
                              DbController().deleteData(insertData(_formState));
                            },
                            buttonColor: Colors.red,
                            buttonText: "Delete",
                          ),
                          ActionButtons(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                print("The form is ready to update");
                                DbController().updateTooltipSettings(
                                    insertData(_formState));
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
                                print("The form is ready to submit");
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
