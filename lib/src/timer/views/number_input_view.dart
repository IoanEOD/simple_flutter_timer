import 'package:flutter/material.dart';
import 'package:simple_timer/src/timer/components/input_display/double-digit_display.dart';
import 'package:simple_timer/src/timer/components/input_display/input_display.dart';
import 'package:simple_timer/src/timer/components/input_keypad/input_keypad.dart';

class NumberInputView extends StatefulWidget {
  final Function(List<List<int>> displayTextArray) onChanged;
  const NumberInputView({Key? key, required this.onChanged}) : super(key: key);

  @override
  _NumberInputViewState createState() => _NumberInputViewState();
}

class _NumberInputViewState extends State<NumberInputView> {
  int activeDisplayIndex = 2;
  List<List<int>> displayTextArray = [
    [0, 0],
    [0, 0],
    [0, 0]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InputDisplay(
          activeDisplayIndex: activeDisplayIndex,
          displayTextArray: displayTextArray,
          onDisplaySelected: (value) => setActiveDisplayIndex(value)),
      InputKeypad(
        onNumberPressed: (number) => onNumberPressed(number),
        onBackspacePressed: () => onBackspacePressed(),
      ),
    ]);
  }

  onNumberPressed(int number) {
    setState(() {
      if (!displayTextArray[activeDisplayIndex]
          .any((element) => element != 0)) {
        displayTextArray[activeDisplayIndex][1] = number;
      } else if (displayTextArray[activeDisplayIndex][0] == 0) {
        if(int.parse("${displayTextArray[activeDisplayIndex][1]}"+"$number") < 60) {
          displayTextArray[activeDisplayIndex][0] =
          displayTextArray[activeDisplayIndex][1];
          displayTextArray[activeDisplayIndex][1] = number;
        }
        else {
          //TODO: Move excess of 60 to the left
        }
      }
      widget.onChanged(displayTextArray);
    });
  }

  onBackspacePressed() {
    setState(() {
      if (displayTextArray[activeDisplayIndex][0] == 0) {
        displayTextArray[activeDisplayIndex][1] = 0;
      } else if (!displayTextArray[activeDisplayIndex]
          .any((element) => element == 0)) {
        displayTextArray[activeDisplayIndex][1] =
            displayTextArray[activeDisplayIndex][0];
        displayTextArray[activeDisplayIndex][0] = 0;
      }
    });
    widget.onChanged(displayTextArray);
  }

  setActiveDisplayIndex(value) {
    setState(() {
      activeDisplayIndex = value;
    });
  }
}
