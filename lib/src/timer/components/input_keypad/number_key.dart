import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NumberKey extends StatelessWidget {
  final int number;
  final Function onPressed;

  const NumberKey({Key? key, required this.number, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(

        child: MaterialButton(
          shape: const CircleBorder(),
          onPressed: () => onPressed(number),
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Text(
                number.toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
            ),
          ),
        ),
      ),
    );
  }
}
