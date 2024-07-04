import 'package:drift/drift.dart';
import 'package:pomo_app/models/pomodoros.dart';
import 'package:pomo_app/models/tasks.dart';

class PomodorosTasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pomodoro => integer().references(Pomodoros, #id)();
  IntColumn get task => integer().references(Tasks, #id)();
}
