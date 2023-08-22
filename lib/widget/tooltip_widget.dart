import 'package:flutter/material.dart';

class CustomTooltip extends StatefulWidget {
  final String message;
  final Widget child;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final double arrowHeight;
  final double arrowWidth;
  final double width;
  final double cornerRadius;
  final double verticalOffset;
  final double paddingTip;

  const CustomTooltip({
    super.key,
    required this.message,
    required this.child,
    required this.fontSize,
    required this.textColor ,
    required this.backgroundColor,
    required this.arrowHeight,
    required this.arrowWidth,
    required this.width ,
    required this.cornerRadius ,
    required this.verticalOffset,
    required this.paddingTip 
  });

  @override
  _CustomTooltipState createState() => _CustomTooltipState();
}

class _CustomTooltipState extends State<CustomTooltip> {
  OverlayEntry? _overlayEntry;

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  void presentTip(BuildContext context, Offset pressLocation) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final childSize = renderBox.size;
    final childCenter = renderBox.localToGlobal(childSize.center(Offset.zero));
    bool isArrowPointingUp;
    double tooltipTop;

    double tooltipHeight =
        widget.arrowHeight + 2 * widget.paddingTip + widget.fontSize;

    bool isBelowButton =
        childCenter.dy + widget.verticalOffset + tooltipHeight <=
            MediaQuery.of(context).size.height;

    if (isBelowButton) {
      tooltipTop = childCenter.dy + widget.verticalOffset;
      isArrowPointingUp = true;
    } else {
      if (widget.message.length > 50) {
        tooltipTop =
            childCenter.dy - widget.verticalOffset - tooltipHeight - 80;
      } else {
        tooltipTop = childCenter.dy - widget.verticalOffset - tooltipHeight;
      }


      isArrowPointingUp = false;
    }

    double initialTooltipLeft = childCenter.dx - widget.width / 2;

    double tooltipLeft;

    if (initialTooltipLeft < 0) {
      tooltipLeft = 0; // Set tooltip to the left edge of the screen
    }
    // Check if the tooltip extends beyond the screen width on the right side
    else if (initialTooltipLeft + widget.width >
        MediaQuery.of(context).size.width) {
      tooltipLeft = MediaQuery.of(context).size.width -
          widget.width; // Set tooltip to the right edge of the screen
    } else {
      tooltipLeft = initialTooltipLeft; // Tooltip is within the screen bounds
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Builder(builder: (context) {
          return Positioned(
            top: tooltipTop,
            left: tooltipLeft,
            width: widget.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isArrowPointingUp) // Show the arrow pointing downward when tooltip is above
                  CustomPaint(
                    size: Size(widget.arrowWidth, widget.arrowHeight),
                    painter:
                        ArrowPainter(widget.backgroundColor, isArrowPointingUp),
                  ),
                Container(
                  padding: EdgeInsets.all(widget.paddingTip),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(widget.cornerRadius),
                  ),
                  child: DefaultTextStyle(
                    style: const TextStyle(decoration: null),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxHeight: 100), // Set maximum height
                      child: SingleChildScrollView(
                        // Use SingleChildScrollView for scrolling
                        child: Text(
                          widget.message,
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: widget.fontSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (!isArrowPointingUp)
                  CustomPaint(
                    size: Size(widget.arrowWidth, widget.arrowHeight),
                    painter:
                        ArrowPainter(widget.backgroundColor, isArrowPointingUp),
                  ),
              ],
            ),
          );
        });
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _dismissTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        presentTip(context, details.globalPosition);
      },
      onLongPressCancel: () {
        _dismissTooltip();
      },
      child: widget.child,
    );
  }
}

class ArrowPainter extends CustomPainter {
  final Color color;
  final bool isArrowPointingUp;

  ArrowPainter(this.color, this.isArrowPointingUp);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isArrowPointingUp) {
      path.moveTo(size.width / 2, 0); // Start from the top center
      path.lineTo(size.width, size.height); // Line to bottom right
      path.lineTo(0, size.height); // Line to bottom left
    } else {
      path.moveTo(size.width / 2, size.height); // Start from the bottom center
      path.lineTo(size.width, 0); // Line to top right
      path.lineTo(0, 0); // Line to top left
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
