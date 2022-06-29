import 'package:flutter/material.dart';
import 'package:rpg_app/src/helper/color_helper.dart';

extension HexColor on Color {
  static MaterialColor fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    final int? convertedColor = int.tryParse(buffer.toString(), radix: 16);
    if (convertedColor == null) return Colors.deepPurple;
    final Color color = Color(convertedColor);
    return MaterialColor(convertedColor, color.getSwatch());
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
