import 'package:flutter/material.dart';

import '../entities/abstract/chat.dart';

class ChatBar extends StatefulWidget {
  final Chat chat;
  final Function() onTap;

  const ChatBar({Key? key, required this.chat, required this.onTap}) : super(key: key);

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: Text(widget.chat.name!, style: TextStyle(
        color: Theme.of(context).focusColor
      )),
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
