import 'package:flutter/material.dart';
import 'package:my_telegram/models/contacts_model.dart';
import 'package:provider/provider.dart';

import '../entities/abstract/chat.dart';
import '../entities/message.dart';
import '../models/search_model.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late final ContactsModel contactsModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    contactsModel = Provider.of<ContactsModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactsModel.contacts.length,
      itemBuilder: buildChatList,
    );
  }

  Widget buildChatList(BuildContext context, int index) {
    Chat? currentChat = contactsModel.contacts[index].chat;
    if (currentChat == null) return const SizedBox.shrink();
    Message? lastMessage = currentChat.getLastMessage();
    String? drafted = currentChat.drafted;
    String text = lastMessage?.text ?? "The person joined in Telegram";
    String? createdDate = lastMessage?.getCreatedDate();
    // bool isChatSelected = widget.selectedChat == currentChat;
    return Consumer<SearchModel>(
      builder: (context, searchModel, _) => Visibility(
        visible: searchModel.text.isEmpty ||
            currentChat.name!.contains(searchModel.text),
        child: ListTile(
          onTap: () {
            contactsModel.setSelectedContactByIndex(index);
            Navigator.pushReplacementNamed(context, '/chat');
          },
          selectedTileColor: Theme.of(context).primaryColor,
          // selected: isChatSelected,
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
                      color:
                          (lastMessage != null) ? Colors.grey : Colors.white),
                ),
              ),
            ],
          ),
          trailing: Column(children: [
            if (createdDate != null)
              Text(
                createdDate,
                style: const TextStyle(color: Colors.grey),
              )
          ]),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
