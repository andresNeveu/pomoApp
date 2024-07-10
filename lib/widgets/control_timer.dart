import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomo_app/widgets/steps_timer.dart';
import 'package:provider/provider.dart';
import 'package:pomo_app/platform/database.dart';
import 'package:pomo_app/queries/longs.dart';
import 'package:pomo_app/queries/pomodoros.dart';
import 'package:pomo_app/queries/shorts.dart';
import 'package:pomo_app/widgets/flow_timer.dart';
import 'package:pomo_app/widgets/numbers_timer.dart';

class ControlTimer extends StatefulWidget {
  const ControlTimer({super.key, this.pomodoroSeconds = 1500, this.shortSeconds = 300, this.longSeconds = 900});
  final int pomodoroSeconds;
  final int shortSeconds;
  final int longSeconds;

  @override
  State<ControlTimer> createState() => _ControlTimerState();
}

class _ControlTimerState extends State<ControlTimer> {
  Timer? _timer;
  late int _seconds = widget.pomodoroSeconds;
  int _step = 1;
  int _pomos = 0;

  void setTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        countdownTimer();
        if (_seconds <= 0) {
          cancelTimer();
          updateTimer();
        }
      });
    });
  }

  void setPlayPause() {
    setState(() {
      if (_timer != null && _timer!.isActive) {
        cancelTimer();
      } else {
        setTimer();
      }
    });
  }

  void setNewTimer(Set<int> newSelection) {
    setState(() {
      _step = newSelection.first;
      if (_timer != null) {
        cancelTimer();
      }
      updateStep();
    });
  }

  void setTimerOnOmit() {
    setState(() {
      cancelTimer();
      updateTimer();
    });
  }

  void countdownTimer() {
    _seconds = _seconds - 1;
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  void updateStep() {
    switch (_step) {
      case 1:
        _seconds = widget.pomodoroSeconds;
      case 2:
        _seconds = widget.shortSeconds;
      case 3:
        _seconds = widget.longSeconds;
    }
  }

  void updateTimer() {
    final db = Provider.of<DB>(context, listen: false);
    switch (_step) {
      case 1:
        createPomodoro(db, widget.pomodoroSeconds);
        _pomos++;
        if (_pomos == 3) {
          _step = 3;
          _seconds = widget.longSeconds;
        } else {
          _step = 2;
          _seconds = widget.shortSeconds;
        }
      case 2:
        createShorts(db, widget.shortSeconds);
        _seconds = widget.pomodoroSeconds;
        _step = 1;
      case 3:
        createLongs(db, widget.longSeconds);
        _seconds = widget.pomodoroSeconds;
        _pomos = 0;
        _step = 1;
    }
  }

  int adjustSeconds(int prev, int cur) {
    int complete = prev - _seconds;
    return complete < cur ? cur - complete : 0;
  }

  @override
  void didUpdateWidget(covariant ControlTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      switch (_step) {
        case 1:
          _seconds = adjustSeconds(oldWidget.pomodoroSeconds, widget.pomodoroSeconds);
        case 2:
          _seconds = adjustSeconds(oldWidget.shortSeconds, widget.shortSeconds);
        case 3:
          _seconds = adjustSeconds(oldWidget.longSeconds, widget.longSeconds);
      }
    });
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  @override
  void initState() {
    if (_timer != null) {
      setTimer();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width / 3,
        height: size.height * 2 / 5,
        padding: EdgeInsets.symmetric(vertical: size.width / 50, horizontal: size.height / 40),
        decoration: BoxDecoration(
          color: Colors.indigo[50],
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Column(
          children: [
            StepsTimer(step: _step, setStep: setNewTimer),
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: size.width / 50, horizontal: size.height / 50),
                    child: NumbersTimer(seconds: _seconds))),
            FlowTimer(
                isActive: _timer != null && _timer!.isActive, handlePlayPause: setPlayPause, handleOmit: setTimerOnOmit)
          ],
        ));
  }
}
