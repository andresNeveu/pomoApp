import 'package:pomo_app/platform/database.dart';

Future<CacheSetting> getCacheSettings(DB db) async {
  try {
    return await db.select(db.cacheSettings).getSingle();
  } catch (e) {
    return const CacheSetting(id: 1, pomodoro: 1500, short: 300, long: 900);
  }
}
