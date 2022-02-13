import 'package:flutter/material.dart';

class DoubleDigitDisplay extends StatelessWidget {
  final String displayText;
  final String title;
  final Function onChanged;

  final int value;
  final int groupValue;

  const DoubleDigitDisplay(
      {Key? key,
      required this.displayText,
      this.title = "",
      required this.value,
      required this.groupValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              onChanged(value);
            },
            child: Text(
              displayText,
              style: TextStyle(
                  color: value == groupValue
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textTheme.bodyText1?.color,
                  fontSize: 50),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 9,
              color: Theme.of(context).textTheme.caption?.color
            ),
          )
        ],
      ),
    );
  }
}
