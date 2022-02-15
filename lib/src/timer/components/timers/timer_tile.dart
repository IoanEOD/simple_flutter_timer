import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:pausable_timer/pausable_timer.dart';

class TimerTile extends StatefulWidget {
  final Function() onDispose;
  final PausableTimer timer;
  final bool isActive;

  const TimerTile({Key? key, required this.timer, required this.isActive, required this.onDispose}) : super(key: key);

  @override
  State<TimerTile> createState() => _TimerTileState();
}

class _TimerTileState extends State<TimerTile> {
  late Duration duration;
  late double begin;


 @override
 void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    duration = widget.isActive && !widget.timer.isPaused ? widget.timer.duration - widget.timer.elapsed : Duration.zero;
    begin = (widget.timer.elapsed.inMilliseconds/widget.timer.duration.inMilliseconds);
    print("Begin: $begin, End: ${widget.isActive && !widget.timer.isPaused ? 1.0 : begin}, Duration: $duration");
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: widget.isActive && !widget.timer.isPaused ? 1.0 : begin),
      duration: duration,
      builder: (context, value, _) => Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 2,
          child: LiquidCircularProgressIndicator(
            value: 1 - value,
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
            backgroundColor: Theme.of(context).dividerColor,
            center: Text(
                "${widget.timer.duration.inHours - widget.timer.elapsed.inHours}"
                ":${widget.timer.duration.inMinutes - widget.timer.elapsed.inMinutes}"
                ":${widget.timer.duration.inSeconds - widget.timer.elapsed.inSeconds}",
                style: const TextStyle(fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
