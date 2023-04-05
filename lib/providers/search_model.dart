import 'package:flutter/cupertino.dart';

class SearchModel extends ChangeNotifier {
  String _text = "";

  String get text => _text;

  set text(String? value) {
    _text = value ?? "";
    print(value);
    notifyListeners();
  }
}
