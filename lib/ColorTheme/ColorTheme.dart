// ignore_for_file: file_names

import 'package:book/core/storage/app_storage.dart';
import 'package:flutter/material.dart';

import '../core/utils/color_constant.dart';

class ThemeProvider extends ChangeNotifier {
  AppStorage appStorage = AppStorage();
  ThemeMode themeMode = ThemeMode.light;
  bool get isdarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(
    bool isOn,
  ) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    appStorage.setDarkMode(isOn);
  }
}

class MyThemes {
  static final darktheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
      selectionHandleColor: Colors.grey,
      selectionColor: Colors.grey,
    ),
    scaffoldBackgroundColor: const Color(0x0f181a1a),
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.black,
    fontFamily: 'outfit',
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static final lightTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
      selectionHandleColor: Colors.grey,
      selectionColor: Colors.grey,
    ),
    scaffoldBackgroundColor: ColorConstant.whiteA700,
    fontFamily: 'outfit',
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.white,
  );
}
