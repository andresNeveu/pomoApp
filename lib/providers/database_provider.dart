import 'package:pomo_app/platform/database.dart';
import 'package:provider/provider.dart';

var databaseProvider = Provider<DB>(
  create: (context) => DB(),
  lazy: false,
  dispose: (context, db) => db.close(),
);
