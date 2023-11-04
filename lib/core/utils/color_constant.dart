import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstant {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color primaryColor = fromHex('#29978A');
  static Color whiteA700 = fromHex('#ffffff');
  static Color black = fromHex('#000000');
  static Color kF3F3F3 = fromHex('#F3F3F3');
  static Color kE1E1E1 = fromHex('#E1E1E1');
  static Color k29978A = fromHex('#29978A');
  static Color kEAF4F4 = fromHex('#EAF4F4');
  static Color k272828 = fromHex('#272828');
  static Color k626666 = fromHex('#626666');
  static Color k5E5E5E = fromHex('#5E5E5E');
  static Color k181919 = fromHex('#181919');
}
