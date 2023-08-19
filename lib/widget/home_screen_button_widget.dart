import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final int index;
  const CustomButton({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      showDuration: const Duration(seconds: 2),
      message: "Hello Brother",
      decoration: BoxDecoration(
        
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 30),
          padding: const EdgeInsets.all(20),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: null,
        child: Text("Button ${index + 1}"),
      ),
    );
  }
}
