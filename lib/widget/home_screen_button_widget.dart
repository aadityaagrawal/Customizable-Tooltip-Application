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
            textStyle: TextStyle(
                fontSize: tipData[isTarget()[1]].textSize.toDouble(),
                color:
                    Color(int.parse('0x${tipData[isTarget()[1]].textColor}'))),
            decoration: ShapeDecoration(
              color: Color(
                  int.parse('0x${tipData[isTarget()[1]].backgroundColor}')),
              shape: ToolTipCustomShape(
                  borderRadius: tipData[isTarget()[1]].cornerRadius.toDouble(),
                  padding: tipData[isTarget()[1]].textPadding.toDouble(),
                  tooltipWidth: tipData[isTarget()[1]].tooltipWidth.toDouble(),
                  arrowWidth: tipData[isTarget()[1]].arrowWidth.toDouble(),
                  arrowHeight: tipData[isTarget()[1]].arrowHeight.toDouble()),
            ),
            message: tipData[isTarget()[1]].toolTipText,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 30),
                padding: const EdgeInsets.all(20),
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
              padding: const EdgeInsets.all(20),
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

class ToolTipCustomShape extends ShapeBorder {
  final double padding;
  final bool preferBelow;
  final double borderRadius;
  final double tooltipWidth;
  final double arrowWidth;
  final double arrowHeight;

  const ToolTipCustomShape({
    required this.borderRadius,
    required this.padding,
    this.preferBelow = false,
    required this.tooltipWidth,
    required this.arrowWidth,
    required this.arrowHeight,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: padding);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double arrowOffset = arrowHeight; // Offset for arrow adjustment

    // Calculate the arrow direction based on tooltip position
    if (preferBelow) {
      rect = Rect.fromPoints(
          rect.topLeft + Offset(0, arrowOffset), rect.bottomRight);
    } else {
      rect = Rect.fromPoints(
          rect.topLeft, rect.bottomRight - Offset(0, arrowOffset));
    }

    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)))
      ..moveTo(rect.topCenter.dx - arrowWidth / 2, rect.topCenter.dy);

    double arrowTipOffset = preferBelow ? arrowOffset : -arrowOffset;
    double arrowBaseOffset = arrowTipOffset + (preferBelow ? 10 : -10);

    path
      ..relativeLineTo(arrowWidth / 2, arrowBaseOffset)
      ..relativeLineTo(arrowWidth / 2, -arrowBaseOffset)
      ..close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
