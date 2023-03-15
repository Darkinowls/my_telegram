import '../entities/message.dart';
import './contacts.dart';
import '../entities/private_chat.dart';

final PrivateChat amogusChat = PrivateChat(messages: [
  Message(
      "Denis from TI-92", DateTime.now().subtract(const Duration(days: 11))),
  Message("Hello,It's Chernousov",
      DateTime.now().subtract(const Duration(days: 10))),
]);

final PrivateChat warChat = PrivateChat(messages: [
  Message(
      "Random Text Random TextRandom TextRandom TextRandom"
      "Random TextRandom TextRandom TextRandom TextRandom TextRandom",
      DateTime.now().subtract(const Duration(days: 3))),
  Message("Let's run", DateTime.now().subtract(const Duration(days: 2))),
  Message(
      "What do you think?", DateTime.now().subtract(const Duration(days: 1))),
]);

final PrivateChat secondOneChat =
    PrivateChat(messages: [Message("It's today", DateTime.now())]);
