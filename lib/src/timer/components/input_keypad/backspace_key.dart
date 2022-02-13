import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BackspaceKey extends StatelessWidget {
  final Function onPressed;

  const BackspaceKey({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(

        child: MaterialButton(
          shape: const CircleBorder(),
          onPressed: () => onPressed(),
          child: const Padding(
            padding: EdgeInsets.all(18),
            child: Icon(
              Icons.backspace_outlined,
              size: 23,
            ),
          ),
        ),
      ),
    );
  }
}
