import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomo_app/widgets/numbers_timer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer? _timer;
  int _seconds = 1500;
  int _step = 1;
  int _pomos = 0;

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  @override
  void dispose() {
    cancelTimer();
    super.dispose();
  }

  void setTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        countdownTimer();
        if (_seconds == 0) {
          cancelTimer();
          updateStep2();
        }
      });
    });
  }

  void setPlayPause() {
    setState(() {
      if (_timer!.isActive) {
        cancelTimer();
      } else if (_seconds > 0) {
        setTimer();
      }
    });
  }

  void setNewTimer() {
    if (_timer != null) {
      setState(() {
        cancelTimer();
        updateTimer();
      });
    }
  }

  void setTimerOnOmit() {
    setState(() {
      cancelTimer();
      updateStep2();
    });
  }

  void countdownTimer() {
    _seconds = _seconds - 1;
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  void updateTimer() {
    switch (_step) {
      case 1:
        _seconds = 1500;
      case 2:
        _seconds = 3;
      case 3:
        _seconds = 900;
    }
  }

  void updateStep2() {
    switch (_step) {
      case 1:
        _pomos++;
        if (_pomos == 3) {
          _step = 3;
          _seconds = 900;
        } else {
          _step = 2;
          _seconds = 3;
        }
      case 2:
        _seconds = 1500;
        _step = 1;
      case 3:
        _seconds = 1500;
        _pomos = 0;
        _step = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Container(
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
                SegmentedButton<int>(
                  style: SegmentedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: size.height / 60, horizontal: size.height / 100),
                      textStyle: TextStyle(fontSize: size.height / 50)),
                  segments: const <ButtonSegment<int>>[
                    ButtonSegment<int>(
                      value: 1,
                      label: Text('Pomodoro'),
                      icon: Icon(Icons.circle_outlined),
                    ),
                    ButtonSegment<int>(
                      value: 2,
                      label: Text('Short Break'),
                      icon: Icon(Icons.circle_outlined),
                    ),
                    ButtonSegment<int>(
                      value: 3,
                      label: Text('Long Break'),
                      icon: Icon(Icons.circle_outlined),
                    ),
                  ],
                  selected: {_step},
                  onSelectionChanged: (Set<int> newSelection) {
                    setState(() {
                      _step = newSelection.first;
                      setNewTimer();
                    });
                  },
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: size.width / 50, horizontal: size.height / 50),
                        child: NumbersTimer(seconds: _seconds))),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                            icon: _timer!.isActive ? const Icon(Icons.pause_circle) : const Icon(Icons.play_circle),
                            onPressed: setPlayPause,
                            label: Text(_timer!.isActive ? 'Pause' : 'Play'))),
                    Align(
                        alignment: Alignment.centerRight,
                        child: _timer!.isActive
                            ? ElevatedButton.icon(
                                label: const Text('Skip'), onPressed: setTimerOnOmit, icon: const Icon(Icons.skip_next))
                            : const Spacer())
                  ],
                )
              ],
            )));
  }
}
