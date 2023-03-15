import 'package:flutter/cupertino.dart';
import 'package:my_telegram/entities/abstract/entity.dart';

import '../message.dart';

abstract class Chat extends Entity {
  late String? name;
  final List<Message?> messages;
  TextEditingController messageController = TextEditingController();

  Chat({this.name, required this.messages});

  Message? getLastMessage() {
    if (messages.isEmpty) return null;
    return messages.last;
  }
}
