import 'package:flutter/foundation.dart';
import '../platform/database.dart';

Future<int> createShorts(DB db, int seconds) async {
  try {
    return await db.into(db.shorts).insert(ShortsCompanion.insert(seconds: seconds, date: DateTime.timestamp()));
  } catch (e) {
    if (kDebugMode) {
      print('Error: create short');
    }
    return 0;
  }
}
