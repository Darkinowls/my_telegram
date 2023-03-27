import 'package:flutter/cupertino.dart';

class DarkModeModel extends ChangeNotifier{
  bool isDark = true;

  void switchDarkMode() {
    isDark = !isDark;
    notifyListeners();
  }
}