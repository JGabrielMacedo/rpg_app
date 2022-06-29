import 'dart:core';

import 'package:flutter/material.dart';

abstract class ThemeProvider {
  Future<MaterialColor> getThemeColor();

  Future<MaterialColor> setThemeColor({MaterialColor color = Colors.deepPurple});
}
