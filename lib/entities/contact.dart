import 'package:my_telegram/entities/private_chat.dart';

import 'abstract/entity.dart';

class Contact extends Entity {
  // photo?
  String name;
  late String? tag;
  late final String? phone;
  PrivateChat? _chat;

  Contact({required this.name, this.tag, this.phone});

  PrivateChat? get chat => _chat;

  set chat(PrivateChat? value) {
    _chat = value;
    _chat?.name ??= name;
  }
}
