import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

buttonStyle() {
  return const ButtonStyle();
}

textFieldStyle(hintMessage) {
  return InputDecoration(
      border: const OutlineInputBorder(), labelText: hintMessage);
}

txtStyle() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
}

ThemeData lightTheme = ThemeData(
  switchTheme: const SwitchThemeData(),
  brightness: Brightness.light,
  useMaterial3: true,
);
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
);

class ThemeManager with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  toggleTheme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
