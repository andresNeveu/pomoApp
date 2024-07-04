import 'package:flutter/material.dart';

class NumbersTimer extends StatelessWidget {
  const NumbersTimer({super.key, required this.seconds});
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        formattedTime(seconds: seconds),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFeatures: [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}

String formattedTime({required int seconds}) {
  int sec = seconds % 60;
  int min = (seconds / 60).floor();
  String minute = min.toString().length <= 1 ? '0$min' : '$min';
  String second = sec.toString().length <= 1 ? '0$sec' : '$sec';
  return '$minute:$second';
}
