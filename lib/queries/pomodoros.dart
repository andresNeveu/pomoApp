import 'package:flutter/foundation.dart';
import '../platform/database.dart';

Future<int> createPomodoro(DB db, int seconds) async {
  try {
    return await db.into(db.pomodoros).insert(PomodorosCompanion.insert(seconds: seconds, date: DateTime.timestamp()));
  } catch (e) {
    if (kDebugMode) {
      print('Error: create pomodoro');
    }
    return 0;
  }
}
