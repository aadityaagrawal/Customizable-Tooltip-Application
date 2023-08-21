import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final bool isReadOnly;
  const CustomTextFromField({
    super.key,
    this.isReadOnly = false,
    required this.textController,
    required this.hintText,
  });

  dynamic validatorFunction(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0)),
      child: TextFormField(
        readOnly: isReadOnly,
        cursorColor: Theme.of(context).primaryColor,
        controller: textController,
        validator: (value) {
          return validatorFunction(value);
        },
        keyboardType: (hintText == "10")
            ? const TextInputType.numberWithOptions(
                signed: false, decimal: false)
            : null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
