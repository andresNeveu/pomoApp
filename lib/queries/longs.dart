import 'package:flutter/foundation.dart';
import '../platform/database.dart';

Future<int> createLongs(DB db, int seconds) async {
  try {
    return await db.into(db.longs).insert(LongsCompanion.insert(seconds: seconds, date: DateTime.timestamp()));
  } catch (e) {
    if (kDebugMode) {
      print('Error: create long');
    }
    return 0;
  }
}
