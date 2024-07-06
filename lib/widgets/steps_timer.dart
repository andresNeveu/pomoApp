import 'package:flutter/material.dart';

class StepsTimer extends StatelessWidget {
  const StepsTimer({super.key, required this.step, required this.setStep});
  final int step;
  final void Function(Set<int>) setStep;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SegmentedButton<int>(
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
      selected: {step},
      onSelectionChanged: setStep,
    );
  }
}
