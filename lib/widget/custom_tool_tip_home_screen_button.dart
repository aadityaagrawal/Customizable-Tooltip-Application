import 'package:flutter/material.dart';
import 'package:trektip/model/tip_model.dart';
import 'package:trektip/widget/tooltip_widget.dart';

class CustomButtonForCustomToolTip extends StatelessWidget {
  final int index;
  final List<TipModel> tipData;
  const CustomButtonForCustomToolTip({
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
        ? CustomTooltip(
            verticalOffset: 40,
            fontSize: tipData[isTarget()[1]].textSize.toDouble(),
            textColor:
                Color(int.parse('0x${tipData[isTarget()[1]].textColor}')),
            message: tipData[isTarget()[1]].toolTipText,
            backgroundColor:
                Color(int.parse('0x${tipData[isTarget()[1]].backgroundColor}')),
            cornerRadius: tipData[isTarget()[1]].cornerRadius.toDouble(),
            arrowHeight: tipData[isTarget()[1]].arrowHeight.toDouble(),
            arrowWidth: tipData[isTarget()[1]].arrowWidth.toDouble(),
            paddingTip: tipData[isTarget()[1]].textPadding.toDouble(),
            width: tipData[isTarget()[1]].tooltipWidth.toDouble(),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 30),
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Text(
                "Button ${index + 1}",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 30),
              padding: const EdgeInsets.all(15),
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              "Button ${index + 1}",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          );
  }
}
