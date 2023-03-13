import '../entities/message.dart';
import './contacts.dart';
import '../entities/chat.dart';

final Chat amogusChat = Chat.private(contact: amogus, messages: [
  Message(
      "Denis from TI-92", DateTime.now().subtract(const Duration(days: 11))),
  Message("Hello,It's Chernousov",
      DateTime.now().subtract(const Duration(days: 10))),
]);

final Chat warChat = Chat.private(contact: war, messages: [
  Message(
      "Random Text Random TextRandom TextRandom TextRandom"
      "Random TextRandom TextRandom TextRandom TextRandom TextRandom",
      DateTime.now().subtract(const Duration(days: 3))),
  Message("Let's run", DateTime.now().subtract(const Duration(days: 2))),
  Message(
      "What do you think?", DateTime.now().subtract(const Duration(days: 1))),
]);

final Chat secondOneChat = Chat.private(
    contact: secondOne, messages: [Message("It's today", DateTime.now())]);

