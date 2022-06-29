import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rpg_app/src/map_error/error.dart';
import 'package:rpg_app/src/repository/theme_color/interface/theme_provider.dart';
import 'package:rpg_app/src/storage/shared_preferences/preferences_error_map.dart';
import 'package:rpg_app/src/storage/shared_preferences/theme_preferences/theme_preferences.dart';

class ThemeFromPreferences implements ThemeProvider {
  final ThemePreferences themePreferences;

  const ThemeFromPreferences({this.themePreferences = const ThemePreferences()});

  @override
  Future<MaterialColor> setThemeColor({MaterialColor color = Colors.deepPurple}) async {
    try {
      final MaterialColor themeColor = await themePreferences.setThemeColor(color: color);
      return themeColor;
    } on SharedPreferencesError catch (err) {
      if (err is CannotSavePreferences) {
        return Future.error(ProjectError(ProjectError.FAILED_TO_GET_CONTENT));
      }
      return Future.error(ProjectError(ProjectError.GENERIC_ERROR));
    } catch (err) {
      return Future.error(ProjectError(ProjectError.GENERIC_ERROR));
    }
  }

  @override
  Future<MaterialColor> getThemeColor() async {
    final MaterialColor themeColor = await themePreferences.themeColor;
    return themeColor;
  }
}
