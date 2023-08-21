import 'package:flutter/material.dart';
import 'package:trektip/model/tip_model.dart';

class CustomButton extends StatelessWidget {
  final int index;
  final List<TipModel> tipData;
  const CustomButton({
    super.key,
    required this.index,
    required this.tipData,
  });

  dynamic isTarget() {
    for (var element in tipData) {
      if (element.targetElement == 'Button ${index + 1}') {
        return [true, tipData.indexOf(element)];
      }
    }
    return [false];
  }

  @override
  Widget build(BuildContext context) {
    return isTarget()[0]
        ? Tooltip(
            verticalOffset: 40,
            padding:
                EdgeInsets.all(tipData[isTarget()[1]].textPadding.toDouble()),
            textStyle: TextStyle(
                fontSize: tipData[isTarget()[1]].textSize.toDouble(),
                color:
                    Color(int.parse('0x${tipData[isTarget()[1]].textColor}'))),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    tipData[isTarget()[1]].cornerRadius.toDouble()),
                color: Color(
                    int.parse('0x${tipData[isTarget()[1]].backgroundColor}')),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/250?image=9'),
                )),
            message: tipData[isTarget()[1]].toolTipText,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 30),
                padding: const EdgeInsets.all(20),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                print(tipData);
              },
              child: Text("Button ${index + 1}"),
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 30),
              padding: const EdgeInsets.all(20),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
            child: Text("Button ${index + 1}"),
          );
  }
}
