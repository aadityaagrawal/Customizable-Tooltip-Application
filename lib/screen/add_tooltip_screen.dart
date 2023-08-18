import 'package:flutter/material.dart';
import 'package:trektip/controller/db_controller.dart';
import 'package:trektip/model/tip_model.dart';

import '../widget/text_field_widget.dart';

class ToolTipForm extends StatefulWidget {
  const ToolTipForm({super.key});

  @override
  State<ToolTipForm> createState() => _ToolTipFormState();
}

class _ToolTipFormState extends State<ToolTipForm> {
  // void insertData() {
  //   final TipModel sampleTip = TipModel(
  //     toolTipText: "Sample Tip Text",
  //     textSize: 16,
  //     textPadding: 10,
  //     textColor: "#000000",
  //     backgroundColor: "#FFFFFF",
  //     cornerRadius: 8,
  //     tooltipWidth: 200,
  //     arrowWidth: 10,
  //     arrowHeight: 20,
  //   );

  //   DbController().insertData(sampleTip);
  // }

  final _formKey = GlobalKey<FormState>();
  int n = 5;
  List<String> dropdownOptions =
      List.generate(5, (index) => 'Button ${index + 1}');
  String? selectedOption;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // insertData();
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
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Tooltip Text'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextFormField(
                        // controller: textField2Controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Text Size'),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextFromField(),
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: false,
                            ),
                            // controller: textField2Controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '10 ',
                            ),
                          ),
                        ),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextFormField(
                        // controller: textField2Controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input',
                        ),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextFormField(
                        // controller: textField2Controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input',
                        ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: false,
                            ),
                            // controller: textField2Controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '10 ',
                            ),
                          ),
                        ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: false,
                            ),
                            // controller: textField2Controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '10 ',
                            ),
                          ),
                        ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: false,
                            ),
                            // controller: textField2Controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '10 ',
                            ),
                          ),
                        ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: TextFormField(
                            keyboardType: const TextInputType.numberWithOptions(
                              signed: false,
                              decimal: false,
                            ),
                            // controller: textField2Controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '10 ',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Theme.of(context).primaryColor),
                      onPressed: () {},
                      child: const Text("Render Tooltip")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
