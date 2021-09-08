import 'package:flutter/material.dart';

extension DarkModeExtension on BuildContext {
  bool get isDarkThemeModeExtension {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
