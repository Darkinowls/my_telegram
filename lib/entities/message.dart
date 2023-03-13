import 'package:intl/intl.dart';

import 'entity.dart';

class Message extends Entity {
  String _text;
  final DateTime _created;
  final bool _isMine;
  bool isChecked = false;
  bool _isEdited = false;

  Message(this._text, this._created, [this._isMine = false]);

  String get text => _text;

  bool get isMine => _isMine;

  set text(String text) {
    _isEdited = true;
    _text = text;
  }

  bool get isEdited => _isEdited;

  String getCreatedDate() {
    return DateFormat("dd.MM.yy").format(_created);
  }

  String getCreatedTime(){
    return  DateFormat("hh:mm").format(_created);
  }
}
