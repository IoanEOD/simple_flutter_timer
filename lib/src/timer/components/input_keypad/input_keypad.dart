import 'package:flutter/material.dart';
import 'package:simple_timer/src/timer/components/input_keypad/backspace_key.dart';
import 'package:simple_timer/src/timer/components/input_keypad/number_key.dart';

class InputKeypad extends StatelessWidget {
  final Function(int number) onNumberPressed;
  final Function onBackspacePressed;

  const InputKeypad({Key? key, required this.onNumberPressed, required this.onBackspacePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberKey(
                  number: 1,
                  onPressed: (number) => onNumberPressed(number),
                ),
                NumberKey(
                  number: 2,
                  onPressed: (number) => onNumberPressed(number)
                ),
                NumberKey(
                  number: 3,
                  onPressed: (number) => onNumberPressed(number)
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberKey(
                  number: 4,
                  onPressed: (number) => onNumberPressed(number),
                ),
                NumberKey(
                  number: 5,
                  onPressed: (number) => onNumberPressed(number),
                ),
                NumberKey(
                  number: 6,
                  onPressed: (number) => onNumberPressed(number),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberKey(
                  number: 7,
                  onPressed: (number) => onNumberPressed(number),
                ),
                NumberKey(
                  number: 8,
                  onPressed: (number) => onNumberPressed(number),
                ),
                NumberKey(
                  number: 9,
                  onPressed: (number) => onNumberPressed(number),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberKey(
                  number: 0,
                  onPressed: (number) => onNumberPressed(number),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 50,
          child: BackspaceKey(onPressed: () => onBackspacePressed(),),
        ),
      ],
    );
  }

}
