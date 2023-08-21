import 'package:flutter/material.dart';
import '../core/utils/color_constant.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isdarkMode => themeMode == ThemeMode.dark;
  void toggleTheme(
    bool isOn,
  ) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darktheme = ThemeData(
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.grey,
          selectionHandleColor: Colors.grey,
          selectionColor: Colors.grey),
      scaffoldBackgroundColor: Color(0XFF181A1A),
      colorScheme: ColorScheme.dark(),
      primaryColor: Colors.black,
      fontFamily: "outfit",
      iconTheme: IconThemeData(color: Colors.black));

  static final lightTheme = ThemeData(  
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.grey,
          selectionHandleColor: Colors.grey, 
          selectionColor: Colors.grey),
      scaffoldBackgroundColor: ColorConstant.whiteA700,
      fontFamily: "outfit",
      colorScheme: ColorScheme.light(),
      primaryColor: Colors.white);
}
