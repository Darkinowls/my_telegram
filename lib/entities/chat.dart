import 'package:my_telegram/entities/message.dart';

class Chat {
  String name;
  final List<Message> _messages;

  Chat(this.name, this._messages);

  Message getLastMessage(){
    return _messages.last;

  }

  List<Message> get messages => _messages;


}
