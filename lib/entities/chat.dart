import 'package:flutter/cupertino.dart';
import 'package:my_telegram/entities/entity.dart';

import 'contact.dart';
import 'message.dart';

class Chat extends Entity {

  late String name;
  late final List<Contact> members;
  final List<Message> messages;
  TextEditingController messageController = TextEditingController();

  Chat.private({required Contact contact, required this.messages}) {
    name = contact.name;
    members = [contact];
  }

  Chat.group(
      {required this.members, this.name = "New Group", required this.messages}){
  }
  // Chat.privateTest

  Message getLastMessage() {
    return messages.last;
  }
}
