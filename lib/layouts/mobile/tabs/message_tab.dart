import 'package:flutter/material.dart';

import '../../../entities/chat.dart';
import '../../../widgets/chat_list.dart';
import '../../../widgets/chat_page.dart';

class MessageTab extends StatefulWidget {

  final List<Chat> chatList;
  final Chat? selectedChat;

  const MessageTab(
      {Key? key,
        required this.chatList,
        required this.selectedChat})
      : super(key: key);

  @override
  State<MessageTab> createState() => _MessageTabState();
}

class _MessageTabState extends State<MessageTab> {
  @override
  Widget build(BuildContext context) {
    return ChatList(
      chatList: widget.chatList,
      selectedChat: widget.selectedChat,
      clickOnTile: (Chat? chat) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Scaffold(body: ChatPage(
                        chat: chat,
                        onBackButton: () => Navigator.pop(context),
                      ),
                    )
            ));
      },
    );
  }
}
