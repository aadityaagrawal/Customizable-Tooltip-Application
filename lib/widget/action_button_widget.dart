import 'package:flutter/material.dart';

/// Button for the add form page

class ActionButtons extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Function()? onTap;
  const ActionButtons({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: onTap,
        child: Text(
          buttonText,
        ),
      ),
    );
  }
}
