import 'package:flutter/material.dart';

class ThemeApp {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    segmentedButtonTheme: SegmentedButtonThemeData(
      selectedIcon: const Icon(Icons.circle_rounded),
      style:
          SegmentedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero))),
    ),
    useMaterial3: true,
  );
}
