import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}