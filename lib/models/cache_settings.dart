import 'package:drift/drift.dart';

class CacheSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pomodoro => integer()();
  IntColumn get short => integer()();
  IntColumn get long => integer()();
}
