import 'package:flutter/material.dart';
import 'package:pomo_app/platform/database.dart';
import 'package:pomo_app/queries/cache_settings.dart';
import 'package:provider/provider.dart';

class SettingsNotifier extends ChangeNotifier {
  CacheSetting? _value;
  final DB db;

  /// An unmodifiable view of the items in the cart.
  CacheSetting? get settings => _value;

  SettingsNotifier({required this.db}) {
    loadValue();
  }

  Future<void> loadValue() async {
    await getCacheSettings(db).then((value) => _value = value).then((value) => notifyListeners());
  }
}

var settingProvider = ChangeNotifierProvider(
  create: (context) {
    return SettingsNotifier(db: Provider.of<DB>(context, listen: false));
  },
  lazy: false,
);
