

import 'package:pausable_timer/pausable_timer.dart';

class PausableTimerWrapper {
  late PausableTimer timer;
  final Function(PausableTimerWrapper) onTimeout;
  final Duration duration;

  PausableTimerWrapper(this.duration, this.onTimeout) {
   timer = PausableTimer(duration, () => onTimeout(this));
  }
}