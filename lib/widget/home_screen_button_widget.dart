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
      // showDuration: const Duration(seconds: 2),
      padding: const EdgeInsets.all(10),
      textStyle: const TextStyle(color: Colors.red),
      decoration: const BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/250?image=9'),
          )),

      message: "Hello Brother",

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 30),
          padding: const EdgeInsets.all(20),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: () {},
        child: Text("Button ${index + 1}"),
      ),
    );
  }
}
