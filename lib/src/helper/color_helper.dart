import 'package:flutter/material.dart';

extension ColorHelper on Color {
  Map<int, Color> getSwatch() {
    final hslColor = HSLColor.fromColor(this);
    final lightness = hslColor.lightness;

    const lowDivisor = 6;
    const highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }

  static Color? defineForegroundColorWithContrastOf(Color? color) {
    if (color == null) return null;

    final yiq = _getYiqFromColor(color);
    final bool canUseWhite = yiq <= 128;

    if (canUseWhite) return Colors.white;
    return Colors.black;
  }

  static double _getYiqFromColor(Color color) {
    return ((color.red * 299) + (color.green * 587) + (color.blue * 114)) / 1000;
  }
}
