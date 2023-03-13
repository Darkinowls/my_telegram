import 'package:flutter/material.dart';

import '../entities/chat.dart';
import '../entities/message.dart';

class ChatList extends StatefulWidget {
  final List<Chat> chatList;
  final Chat? selectedChat;
  final Function clickOnTile;

  const ChatList(
      {Key? key,
      required this.chatList,
      required this.selectedChat,
      required this.clickOnTile})
      : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.chatList.length,
      itemBuilder: buildChatList,
    );
  }

  Widget buildChatList(BuildContext context, int index) {
    Chat currentChat = widget.chatList[index];
    String drafted = currentChat.messageController.text;
    Message lastMessage = currentChat.getLastMessage();
    String text = (drafted.isNotEmpty) ? drafted : lastMessage.text;
    String createdDate = lastMessage.getCreatedDate();
    bool isChatSelected = widget.selectedChat == currentChat;

    return ListTile(
      onTap: () => setState(() => widget.clickOnTile(currentChat)),
      selectedTileColor: Theme.of(context).primaryColor,
      selected: isChatSelected,
      title: Text(currentChat.name),
      selectedColor: Colors.white,
      subtitle: Row(
        children: [
          if (drafted.isNotEmpty)
            Text(
              "Draft: ",
              style:
                  TextStyle(color: isChatSelected ? Colors.white : Colors.red),
            ),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      leading: const Icon(Icons.account_circle_rounded, size: 40),
      trailing: Column(children: [
        Text(
          createdDate,
          style:
              TextStyle(color: (isChatSelected) ? Colors.white : Colors.grey),
        )
      ]),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }
}
