import 'package:flutter/material.dart';

extension StringExtintion on String {
  Color get toColor {
    var hexColor = this;
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    final hexNum = int.parse(hexColor, radix: 16);
    if (hexNum == 0) {
      return const Color(0xff000000);
    }
    return Color(hexNum);
  }
}
