import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomo_app/queries/longs.dart';
import 'package:pomo_app/queries/pomodoros.dart';
import 'package:pomo_app/queries/shorts.dart';
import 'package:pomo_app/widgets/flow_timer.dart';
import 'package:pomo_app/widgets/header.dart';
import 'package:pomo_app/widgets/numbers_timer.dart';
import 'package:pomo_app/widgets/steps_timer.dart';
import 'package:provider/provider.dart';

import '../platform/database.dart';

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
        _seconds = 1500;
      case 2:
        _seconds = 300;
      case 3:
        _seconds = 900;
    }
  }

  void updateTimer() {
    final db = Provider.of<DB>(context, listen: false);
    switch (_step) {
      case 1:
        createPomodoro(db, 1500);
        _pomos++;
        if (_pomos == 3) {
          _step = 3;
          _seconds = 900;
        } else {
          _step = 2;
          _seconds = 3;
        }
      case 2:
        createShorts(db, 300);
        _seconds = 1500;
        _step = 1;
      case 3:
        createLongs(db, 900);
        _seconds = 1500;
        _pomos = 0;
        _step = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          const Header(),
          Container(
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
                      isActive: _timer != null && _timer!.isActive,
                      handlePlayPause: setPlayPause,
                      handleOmit: setTimerOnOmit)
                ],
              )),
        ],
      ),
    );
  }
}
