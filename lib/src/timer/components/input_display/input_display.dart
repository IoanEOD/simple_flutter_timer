import 'package:flutter/material.dart';

import 'double-digit_display.dart';

class InputDisplay extends StatelessWidget {
  final Function(int index) onDisplaySelected;
  final int activeDisplayIndex;
  final List<List<int>> displayTextArray;

  const InputDisplay(
      {Key? key,
      required this.onDisplaySelected,
      required this.activeDisplayIndex,
      required this.displayTextArray})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle colonTextStyle =
    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DoubleDigitDisplay(
              displayText: displayTextArray[0][0].toString() + displayTextArray[0][1].toString(),
              title: "Hour",
              value: 0,
              groupValue: activeDisplayIndex,
              onChanged: (value) => onDisplaySelected(value),
            ),
            Text(
              ":",
              style: colonTextStyle,
            ),
            DoubleDigitDisplay(
              displayText: displayTextArray[1][0].toString() + displayTextArray[1][1].toString(),
              title: "Minute",
              value: 1,
              groupValue: activeDisplayIndex,
              onChanged: (value) => onDisplaySelected(value),
            ),
            Text(
              ":",
              style: colonTextStyle,
            ),
            DoubleDigitDisplay(
              displayText: displayTextArray[2][0].toString() + displayTextArray[2][1].toString(),
              title: "Second",
              value: 2,
              groupValue: activeDisplayIndex,
              onChanged: (value) => onDisplaySelected(value),
            ),
          ],
        )
      ],
    );
  }
}