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
  int _start = 1500;
  int _step = 1;

  @override
  void initState() {
    super.initState();
    createTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void createTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      updateTimer();
      if (_start == 0) {
        t.cancel();
      }
    });
  }

  void updateTimer() {
    setState(() {
      _start = _start - 1;
    });
  }

  void setTimer() {
    if (_timer != null) {
      setState(() {
        _timer?.cancel();
        setStart();
        createTimer();
      });
    }
  }

  void setStart() {
    switch (_step) {
      case 1:
        _start = 1500;
      case 2:
        _start = 300;
      case 3:
        _start = 900;
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
                      setTimer();
                    });
                  },
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: size.width / 50, horizontal: size.height / 50),
                        child: NumbersTimer(seconds: _start))),
              ],
            )));
  }
}
