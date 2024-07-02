import 'package:drift/drift.dart';

class Pomodoros extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get seconds => integer()();
  DateTimeColumn get date => dateTime()();
}
