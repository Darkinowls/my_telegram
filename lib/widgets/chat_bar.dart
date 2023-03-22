import 'package:flutter/material.dart';

import '../entities/abstract/chat.dart';

class ChatBar extends StatelessWidget {
  final Chat chat;
  final Function() onTap;

  const ChatBar({Key? key, required this.chat, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
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
    );
  }
}
