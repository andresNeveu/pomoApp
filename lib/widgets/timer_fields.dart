import 'package:flutter/material.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

class TimerFields extends StatelessWidget {
  const TimerFields({super.key, required this.pomodoroController});
  final TextEditingController pomodoroController;

  @override
  Widget build(BuildContext context) {
// FormState form = Form.of(context);
    return Column(
      children: [
        TextField(
          controller: pomodoroController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            NumberTextInputFormatter(
              integerDigits: 3,
            )
          ],
        ),
        ElevatedButton(
            onPressed: () {
              print(pomodoroController.text);
            },
            child: Text('Submit'))
      ],
    );
  }
}
