import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final LocalNotification exampleNotification = LocalNotification(
      identifier: '_exampleNotification',
      title: 'example',
      body: 'hello flutter!',
      actions: [
        LocalNotificationAction(
          text: 'Yes',
        ),
        LocalNotificationAction(
          text: 'No',
        ),
      ],
    );

    exampleNotification.onClickAction = (int i) {
      if (kDebugMode) {
        print(i);
      }
    };

    return Center(
      child: ElevatedButton(
          onPressed: () {
            exampleNotification.show();
          },
          child: const Text('Notificación')),
    );
  }
}
