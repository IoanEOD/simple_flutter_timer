import 'package:flutter/material.dart';

class ControlPanel extends StatelessWidget {
  final bool isPlaying;
  final bool isTimerView;
  final Function() onPlay;
  final Function() onPause;
  final Function() onDelete;
  final Function() onCreateTimer;

  const ControlPanel(
      {Key? key,
      required this.isPlaying,
      required this.onPlay,
      required this.onPause,
      required this.onDelete,
      required this.onCreateTimer,
      required this.isTimerView,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isTimerView)
          IconButton(
            iconSize: 24,
            icon: const Icon(Icons.delete),
            color: Colors.white,
            onPressed: () => onDelete(),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor,
              shape: const CircleBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: IconButton(
                iconSize: 24,
                icon: isPlaying
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
                color: Colors.white,
                onPressed: () {
                  if (isPlaying) {
                    onPause();
                  } else {
                    onPlay();
                  }
                },
              ),
            ),
          ),
        ),
        if (isTimerView)
          IconButton(
            iconSize: 24,
            icon: const Icon(Icons.add_circle_outline),
            color: Colors.white,
            onPressed: () => onCreateTimer(),
          ),
      ],
    );
  }
}
