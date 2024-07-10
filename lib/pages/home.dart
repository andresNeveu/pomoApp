import 'package:flutter/material.dart';
import 'package:pomo_app/platform/database.dart';
import 'package:pomo_app/providers/settings_provider.dart';
import 'package:pomo_app/widgets/control_timer.dart';
import 'package:pomo_app/widgets/header.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Header(),
        const SizedBox(
          height: 12,
        ),
        Consumer<SettingsNotifier>(builder: (BuildContext context, SettingsNotifier value, Widget? child) {
          if (value.settings != null) {
            CacheSetting settings = value.settings!;
            return ControlTimer(
              pomodoroSeconds: settings.pomodoro,
            );
          }
          return const CircularProgressIndicator();
        }),
      ],
    ));
  }
}
