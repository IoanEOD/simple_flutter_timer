import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:simple_timer/src/timer/components/timers/timer_tile.dart';
import 'package:simple_timer/src/timer/models/pausable_timer_wrapper.dart';

class TimerView extends StatelessWidget {
  final List<PausableTimerWrapper> timerWrappers;
  final Function(int) onPageChanged;
  final PageController pageController;
  final int pageIndex;

  const TimerView({Key? key, required this.timerWrappers, required this.onPageChanged, required this.pageController ,required this.pageIndex}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          isAlwaysShown: true,
          controller: pageController,
          child: PageView.builder(
            controller: pageController,
              itemCount: timerWrappers.length,
              scrollDirection: Axis.vertical,
              onPageChanged: (page) => onPageChanged(page),
              itemBuilder: (context, index) {
                return TimerTile(timer: timerWrappers[index].timer, isActive: index == pageIndex, onDispose: () {},);
              }),
        );
      });
  }

  onDispose() {

  }
}
