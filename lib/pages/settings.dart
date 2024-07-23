import 'package:flutter/material.dart';
import 'package:pomo_app/widgets/settings_form.dart';
import 'package:provider/provider.dart';
import '../platform/database.dart';
import '../providers/settings_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
        child: Container(
      padding: const EdgeInsets.all(18),
      width: size.width * 2 / 5,
      height: size.height,
      child: Consumer<SettingsNotifier>(builder: (BuildContext context, SettingsNotifier value, Widget? child) {
        if (value.settings != null) {
          CacheSetting settings = value.settings!;
          return SettingsForm(
            setting: settings,
          );
        }
        return const CircularProgressIndicator();
      }),
    ));
  }
}
