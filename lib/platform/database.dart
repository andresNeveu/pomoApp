import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:pomo_app/models/cache_settings.dart';
import 'package:pomo_app/models/pomodoros_tasks.dart';
import 'package:pomo_app/models/longs.dart';
import 'package:pomo_app/models/pomodoros.dart';
import 'package:pomo_app/models/shorts.dart';
import 'package:pomo_app/models/tasks.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dbFolder = await getApplicationSupportDirectory();
    final File file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Pomodoros, Shorts, Longs, Tasks, PomodorosTasks, CacheSettings])
class DB extends _$DB {
  DB() : super(_openConnection());

  @override
  MigrationStrategy get migration => MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
        await into(cacheSettings).insert(CacheSettingsCompanion.insert(pomodoro: 1500, short: 300, long: 900));
      },
      onUpgrade: (Migrator m, int from, int to) async {});

  @override
  int get schemaVersion => 1;
}
