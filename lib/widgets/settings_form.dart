import 'package:flutter/material.dart';
import 'package:pomo_app/platform/database.dart';
import 'package:pomo_app/widgets/timer_fields.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key, required this.setting});
  final CacheSetting setting;

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> with TickerProviderStateMixin {
  late final TabController _tabController;
  final _form = GlobalKey<FormState>();
  final _pomodoroController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.09,
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(
                    text: 'Timer',
                    iconMargin: EdgeInsets.zero,
                    icon: Icon(Icons.timer),
                  ),
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              height: constraints.maxHeight * 0.8,
              child: TabBarView(controller: _tabController, children: [
                Center(
                  child: TimerFields(pomodoroController: _pomodoroController),
                ),
              ]),
            )
          ],
        );
      }),
    );
  }
}
