import 'package:flutter/material.dart';
import 'package:rpg_app/src/repository/theme_color/interface/theme_provider.dart';
import 'package:rpg_app/src/repository/theme_color/provider/from_preferences.dart';

class ThemeRepository {
  final ThemeProvider provider;

  const ThemeRepository({this.provider = const ThemeFromPreferences()});

  Future<MaterialColor> setThemeColor({MaterialColor color = Colors.deepPurple}) {
    return provider.setThemeColor(color: color);
  }

  Future<MaterialColor> getThemeColor() async {
    return await provider.getThemeColor();
  }
}
