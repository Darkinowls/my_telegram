import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entities/abstract/chat.dart';
import '../entities/contact.dart';
import '../widgets/chat_bar.dart';
import '../widgets/chat_page.dart';
import '../widgets/pop_back_arrow.dart';

class ChatScreen extends StatelessWidget {
  final Contact contact;
  final Function(Contact) navigateToContact;
  final Function(Chat, String) sendMessage;
  final Function(Chat, String?) setDrafted;

  const ChatScreen(
      {Key? key,
      required this.contact,
      required this.navigateToContact,
      required this.sendMessage,
      required this.setDrafted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopBackArrowButton(),
        title: ChatBar(
          chat: contact.privateChat!,
          onTap: () => navigateToContact(contact),
        ),
      ),
      body: ChatPage(
        sendMessage: (String text) => sendMessage(contact.privateChat!, text),
        chat: contact.privateChat!,
        setDrafted: (String? text) => setDrafted(contact.privateChat!, text),
      ),
    );
  }
}
