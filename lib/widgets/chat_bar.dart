import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entities/abstract/chat.dart';
import '../models/contacts_model.dart';
class ChatBar extends StatelessWidget {

  const ChatBar({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<ContactsModel, Chat>(
      selector: (context, contactsModel) => contactsModel.selectedContact!.chat!,
      builder: (context, chat, child) => ListTile(
        onTap: () => Navigator.pushReplacementNamed(context, '/contact'),
        title: Text(chat.name!,
            style: TextStyle(color: Theme.of(context).focusColor)),
        subtitle: const Text("last seen recently",
            style: TextStyle(color: Colors.grey)),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.phone)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
