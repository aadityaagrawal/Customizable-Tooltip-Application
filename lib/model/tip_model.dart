class TipModel {
  final int? id;
  final String targetElement;
  final String toolTipText;
  final int textSize;
  final int textPadding;
  final String textColor;
  final String backgroundColor;
  final int cornerRadius;
  final int tooltipWidth;
  final int arrowWidth;
  final int arrowHeight;

  TipModel({
    this.id,
    required this.targetElement,
    required this.toolTipText,
    required this.textSize,
    required this.textPadding,
    required this.textColor,
    required this.backgroundColor,
    required this.cornerRadius,
    required this.tooltipWidth,
    required this.arrowWidth,
    required this.arrowHeight,
  });

  /// Converts the [TipModel] object to a map for database storage.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "targetElement": targetElement,
      'toolTipText': toolTipText,
      'textSize': textSize,
      'textPadding': textPadding,
      'textColor': textColor,
      'backgroundColor': backgroundColor,
      'cornerRadius': cornerRadius,
      'tooltipWidth': tooltipWidth,
      'arrowWidth': arrowWidth,
      'arrowHeight': arrowHeight,
    };
  }

  /// Creates a [TipModel] object from a map retrieved from the database.
  factory TipModel.fromMap(Map<String, dynamic> map) {
    return TipModel(
      id: map['id'],
      toolTipText: map['toolTipText'],
      textSize: map['textSize'],
      textPadding: map['textPadding'],
      textColor: map['textColor'],
      backgroundColor: map['backgroundColor'],
      cornerRadius: map['cornerRadius'],
      tooltipWidth: map['tooltipWidth'],
      arrowWidth: map['arrowWidth'],
      arrowHeight: map['arrowHeight'],
      targetElement: map['targetElement'],
    );
  }

  @override
  String toString() {
    return 'TooltipSettings{id: $id, targetElement: $targetElement ,toolTipText: $toolTipText, textSize: $textSize, textPadding: $textPadding, textColor: $textColor, backgroundColor: $backgroundColor, cornerRadius: $cornerRadius, tooltipWidth: $tooltipWidth, arrowWidth: $arrowWidth, arrowHeight: $arrowHeight}';
  }
}
