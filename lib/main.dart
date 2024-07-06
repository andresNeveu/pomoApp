import 'package:flutter/material.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:pomo_app/pages/home.dart';
import 'package:pomo_app/platform/database_provider.dart';
import 'package:pomo_app/style/theme_app.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  await localNotifier.setup(
    appName: 'Pomo App',
    shortcutPolicy: ShortcutPolicy.requireCreate,
  );

  WindowOptions windowOptions = const WindowOptions(
    minimumSize: Size(1280, 720),
    title: 'Pomo App',
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(MultiProvider(providers: [databaseProvider], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomo App',
      theme: ThemeApp.theme,
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}
