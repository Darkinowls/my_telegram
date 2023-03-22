import 'package:flutter/material.dart';

import '../entities/abstract/chat.dart';
import '../entities/contact.dart';
import '../entities/message.dart';

class ChatList extends StatefulWidget {
  final List<Contact> contacts;
  final Function(Contact contact) onTap;
  final Chat? selectedChat;
  final TextEditingController searchController;

  const ChatList(
      {Key? key,
      required this.onTap,
      required this.contacts,
      this.selectedChat,
      required this.searchController})
      : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final List<Chat?> chatList = [];
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    chatList.addAll(widget.contacts.map((e) => e.privateChat));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: buildChatList,
    );
  }

  Widget buildChatList(BuildContext context, int index) {
    Chat? currentChat = chatList[index];
    if (currentChat == null) return const SizedBox.shrink();
    Message? lastMessage = currentChat.getLastMessage();
    String? drafted = currentChat.drafted;
    String text = lastMessage?.text ?? "The person joined in Telegram";
    String? createdDate = lastMessage?.getCreatedDate();
    bool isChatSelected = widget.selectedChat == currentChat;

    return Visibility(
      visible: widget.searchController.text.isEmpty ||
          currentChat.name!.contains(widget.searchController.text),
      child: ListTile(
        onTap: () {
          widget.onTap(widget.contacts[index]);
        },
        selectedTileColor: Theme.of(context).primaryColor,
        selected: isChatSelected,
        leading: const Icon(Icons.account_circle_rounded, size: 40),
        title: Text(currentChat.name!),
        selectedColor: Colors.white,
        subtitle: Row(
          children: [
            if (drafted != null)
              const Text(
                "Draft: ",
                style: TextStyle(color: Colors.red),
              ),
            Expanded(
              child: Text(
                drafted ?? text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: (lastMessage != null) ? Colors.grey : Colors.white),
              ),
            ),
          ],
        ),
        trailing: Column(children: [
          if (createdDate != null)
            Text(
              createdDate,
              style: TextStyle(
                  color: (isChatSelected) ? Colors.white : Colors.grey),
            )
        ]),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}
