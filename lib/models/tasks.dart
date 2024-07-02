import 'package:drift/drift.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pomodoros => integer()();
  TextColumn get name => text()();
}
