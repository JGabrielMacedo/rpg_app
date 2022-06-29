import 'package:flutter/material.dart';
import 'package:rpg_app/src/helper/hex_color.dart';
import 'package:rpg_app/src/storage/shared_preferences/preferences_error_map.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  final SharedPreferences? _preferences;
  final String _themePath = "rpg_app.theme_preferences";

  const ThemePreferences({SharedPreferences? preferences}) : _preferences = preferences;

  Future<SharedPreferences> get _myPreferences async =>
      _preferences ?? await SharedPreferences.getInstance();

  Future<MaterialColor> get themeColor async {
    final SharedPreferences preferences = await _myPreferences;

    final String? themeColorString = preferences.getString(_themePath);
    if (themeColorString == null) return await setThemeColor();

    final MaterialColor customThemeColor = HexColor.fromHex(themeColorString);

    return customThemeColor;
  }

  Future<MaterialColor> setThemeColor({MaterialColor color = Colors.deepPurple}) async {
    final SharedPreferences preferences = await _myPreferences;
    final String hexColor = color.toHex();
    final bool themeColorString = await preferences.setString(_themePath, hexColor);

    if (themeColorString) return themeColor;
    throw CannotSavePreferences(_themePath);
  }
}
