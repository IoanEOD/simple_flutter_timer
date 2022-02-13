import 'package:flutter/material.dart';
import 'package:simple_timer/src/timer/components/input_display/double-digit_display.dart';
import 'package:simple_timer/src/timer/components/input_display/input_display.dart';
import 'package:simple_timer/src/timer/components/input_keypad/input_keypad.dart';

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  _TimerViewState createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  int activeDisplayIndex = 2;
  List<List<int>> displayTextArray = [[0,0], [0,0], [0,0]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Column(children: [
        InputDisplay(
          activeDisplayIndex: activeDisplayIndex,
          displayTextArray: displayTextArray,
          onDisplaySelected: (value) => setActiveDisplayIndex(value)
        ),
        InputKeypad(
          onNumberPressed: (number) => onNumberPressed(number),
          onBackspacePressed: () => onBackspacePressed(),
        ),
      ]),
    );
  }

  onNumberPressed(int number) {
    setState(() {
      if(!displayTextArray[activeDisplayIndex].any((element) => element != 0)) {
        print(displayTextArray[activeDisplayIndex][0]);
        displayTextArray[activeDisplayIndex][1] = number;
      }
      else if(displayTextArray[activeDisplayIndex][0] == 0) {
        displayTextArray[activeDisplayIndex][0] = displayTextArray[activeDisplayIndex][1];
        displayTextArray[activeDisplayIndex][1] = number;
      }
    });
  }

  onBackspacePressed() {
    setState(() {
      if(displayTextArray[activeDisplayIndex][0] == 0) {
        displayTextArray[activeDisplayIndex][1] = 0;
      }
      else if(!displayTextArray[activeDisplayIndex].any((element) => element == 0)) {
        displayTextArray[activeDisplayIndex][1] = displayTextArray[activeDisplayIndex][0];
        displayTextArray[activeDisplayIndex][0] = 0;
      }
    });
  }

  setActiveDisplayIndex(value) {
    setState(() {
      activeDisplayIndex = value;
    });
  }
}
