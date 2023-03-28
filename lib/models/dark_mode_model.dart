import 'package:flutter/cupertino.dart';

class DarkModeModel extends ChangeNotifier{ //simple
  bool isDark = true;

  void switchDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }
}