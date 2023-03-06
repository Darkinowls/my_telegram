import 'package:flutter/material.dart';
import 'package:my_telegram/widgets/t_text_field.dart';

import '../entities/chat.dart';
import '../entities/message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  double? width;
  List<Chat> chatList = [];
  int? selectedChatIndex;

  @override
  void initState() {
    super.initState();
    chatList.addAll([
      Chat("Amongus", [
        Message("Denis from TI-92",
            DateTime.now().subtract(const Duration(days: 11))),
        Message("Hello,It's Chernousov",
            DateTime.now().subtract(const Duration(days: 10))),
      ]),
      Chat("The Second Chat", [
        Message(
            "Random Text Random TextRandom TextRandom TextRandom"
            "Random TextRandom TextRandom TextRandom TextRandom TextRandom",
            DateTime.now().subtract(const Duration(days: 3))),
        Message("Let's run", DateTime.now().subtract(const Duration(days: 2))),
        Message("What do you think?",
            DateTime.now().subtract(const Duration(days: 1))),
      ]),
      Chat("The Last Chat", [Message("It's today", DateTime.now())]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [

          if ((width <= 600 && selectedChatIndex == null) || width > 600)
          Expanded(
              flex: 2,
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.grey,
                      ),
                      padding: const EdgeInsets.all(20),
                      iconSize: 25,
                    ),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 20),
                            child: TTextField(
                                icon: Icons.close,
                                function: searchController.clear,
                                textController: searchController,
                                hintText: 'Search')))
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: chatList.length, itemBuilder: buildChatList))
              ])),
          if ((width <= 600 && selectedChatIndex != null) || width > 600)
            Expanded(
              flex: 3,
              child: Stack(children: [
                Ink.image(
                  image: const NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                if (selectedChatIndex != null) buildChatWindow(),
              ]),
            ),
        ],
      ),
    );
  }

  Widget buildChatList(BuildContext context, int index) {
    Message lastMessage = chatList[index].getLastMessage();
    return ListTile(
      onTap: () {
        setState(() {
          selectedChatIndex = index;
        });
      },
      hoverColor: (selectedChatIndex == index)
          ? Colors.teal
          : const Color.fromRGBO(53, 60, 67, 1),
      tileColor: (selectedChatIndex == index) ? Colors.teal : null,
      title: Text(chatList[index].name,
          style: const TextStyle(color: Colors.white)),
      subtitle: Text(
          (lastMessage.text.length > 25)
              ? "${lastMessage.text.substring(0, 25)}..."
              : lastMessage.text,
          style: TextStyle(
              color:
                  (selectedChatIndex == index) ? Colors.white : Colors.grey)),
      leading: const Icon(Icons.account_circle_rounded, size: 40),
      trailing: Column(children: [
        Text(
          lastMessage.getCreatedDate(),
          style: TextStyle(
              color: (selectedChatIndex == index) ? Colors.white : Colors.grey),
        ),
      ]),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  Widget buildChatWindow() {
    Chat chat = chatList[selectedChatIndex!];
    return Column(
      children: [
        Ink(
            color: const Color(0xFF282f36),
            height: 68,
            child: ListTile(
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    selectedChatIndex = null;
                  });
                },
                icon: const Icon(Icons.arrow_back, color: Colors.grey),
              ),
              subtitle: const Text("last seen recently",
                  style: TextStyle(color: Colors.grey)),
              onTap: () {},
              title:
                  Text(chat.name, style: const TextStyle(color: Colors.white)),
              trailing: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: Colors.grey)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.phone, color: Colors.grey)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert, color: Colors.grey)),
                  ],
                ),
              ),
            )),
        Flexible(
          child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20),
              itemCount: chat.messages.length,
              itemBuilder: buildMessageList),
        ),
        Ink(
            color: const Color(0xFF3d444b),
            child: TTextField(
                icon: Icons.send,
                function: () {
                  setState(() {
                    chatList[selectedChatIndex!]
                        .messages
                        .add(Message(messageController.text, DateTime.now()));
                    messageController.clear();
                  });
                },
                textController: messageController,
                hintText: "Write a message...")),
      ],
    );
  }

  Widget buildMessageList(BuildContext context, int index) {
    Chat chat = chatList[selectedChatIndex!];
    Message message = chat.messages[chat.messages.length - 1 - index];
    return Container(
      padding: const EdgeInsets.only(right: 100, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(Icons.account_circle_rounded, size: 36),
          const SizedBox(width: 10),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(53, 60, 67, 1),
              ),
              child: Stack(children: [
                Container(
                  padding: const EdgeInsets.only(right: 50, bottom: 5),
                  child: Text(message.text,
                      style: const TextStyle(color: Colors.white)),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(message.getCreatedTime(),
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
