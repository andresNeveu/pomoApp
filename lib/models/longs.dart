import 'package:drift/drift.dart';

class Longs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get seconds => integer()();
  DateTimeColumn get date => dateTime()();
}
