import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:simple_timer/src/timer/components/control_panel/control_panel.dart';
import 'package:simple_timer/src/timer/models/pausable_timer_wrapper.dart';
import 'package:simple_timer/src/timer/views/number_input_view.dart';
import 'package:simple_timer/src/timer/views/timer_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  late Widget view;
  List<PausableTimerWrapper> timerWrappers = [];
  int timerIndex = 0;
  bool isPlaying = false;
  bool isTimerView = false;
  bool creatingNew = true;
  List<List<int>> displayTextArray = [
    [0, 0],
    [0, 0],
    [0, 0]
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    view = NumberInputView(onChanged: (array) => onDisplayChange(array));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer"),
      ),
      body: Column(
        children: [
          Container(
            height: (7.5*MediaQuery.of(context).size.height)/10,
            child: AnimatedSwitcher(
              child: view,
              duration: const Duration(milliseconds: 100),
            ),
          ),
          ControlPanel(
            isPlaying: isPlaying,
            isTimerView: isTimerView,
            onPlay: () => onPlay(),
            onPause: () => onPause(),
            onDelete: () => onDelete(),
            onCreateTimer: () => onCreateTimer(),
          )
        ],
      ),
    );
  }

  onPlay() {
    setState(() {
      isPlaying = true;
      if(!isTimerView) {
        int hours =
        int.parse("${displayTextArray[0][0]}${displayTextArray[0][1]}");
        int minutes =
        int.parse("${displayTextArray[1][0]}${displayTextArray[1][1]}");
        int seconds =
        int.parse("${displayTextArray[2][0]}${displayTextArray[2][1]}");
        PausableTimerWrapper timerWrapper = PausableTimerWrapper(
            Duration(hours: hours, minutes: minutes, seconds: seconds), (wrapper) => onTimeout(wrapper) );
        timerWrappers.add(timerWrapper);
        timerWrapper.timer.start();
        timerIndex = timerWrappers.length - 1;
        setToTimerView();
        // moveToTimerIndex(timerIndex);
      }
      else {
        timerWrappers[timerIndex].timer.start();
        setToTimerView();
      }
    });
  }

  onPause() {
    setToTimerView();
   pauseActiveTimer();
  }

  onDelete() {
    setState(() {
      timerWrappers[timerIndex].timer.cancel();
      timerWrappers.removeAt(timerIndex);
      if (timerWrappers.isEmpty) {
        view = NumberInputView(onChanged: (array) => onDisplayChange(array));
        isTimerView = false;
        isPlaying = false;
        timerIndex = 0;
      } else {
        timerIndex = timerIndex == 0 ? 0 : timerIndex - 1;
        moveToTimerIndex(timerIndex);
        setToTimerView();
      }
    });
  }

  onCreateTimer() {
    setState(() {
      view = NumberInputView(onChanged: (array) => onDisplayChange(array));
      isPlaying = false;
      isTimerView = false;
    });
  }

  onDisplayChange(List<List<int>> array) {
    setState(() {
      displayTextArray = array;
    });
  }

  onTimeout(PausableTimerWrapper wrapper) {
    {
      print("Timer No. ${timerWrappers.length + 1}Ended");
      setToTimerView();
      moveToTimerIndex(timerWrappers.indexOf(wrapper));
      pauseActiveTimer();
    }
  }

  onPageChanged(int page) {
    setState(() {
      print(page);
      timerIndex = page;
    });
  }

  pauseActiveTimer() {
    setState(() {
      isPlaying = false;
      timerWrappers[timerIndex].timer.pause();
    });
  }

  setToTimerView() {
    setState(() {
      view  = TimerView(timerWrappers: timerWrappers, onPageChanged: (page) => onPageChanged(page), pageController: pageController, pageIndex: timerIndex,);
      isTimerView = true;
    });
  }

  moveToTimerIndex(int index) {
    if(pageController.hasClients) {
      pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
  }

}
