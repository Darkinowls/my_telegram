import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entities/abstract/chat.dart';
import '../entities/contact.dart';
import '../widgets/contact_page.dart';
import '../widgets/pop_back_arrow.dart';

class ContactScreen extends StatelessWidget {
  final Contact contact;
  final Function(Contact) navigateToChat;
  final Function(Chat, String) sendMessage;
  final Function(Chat, String?) setDrafted;

  const ContactScreen(
      {Key? key,
      required this.contact,
      required this.navigateToChat,
      required this.sendMessage,
      required this.setDrafted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopBackArrowButton(),
        title: Text("User info",
            style: TextStyle(color: Theme.of(context).focusColor)),
      ),
      body: ContactPage(
          contact: contact, onTap: () => navigateToChat(contact)),
    );

  }
}
