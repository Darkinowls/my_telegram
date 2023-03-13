import 'package:flutter/material.dart';

import '../entities/chat.dart';
import '../entities/message.dart';
import 't_text_field.dart';

class ChatPage extends StatefulWidget {
  final Chat? chat;
  final Function() onBackButton;

  const ChatPage({
    required this.chat,
    Key? key,
    required this.onBackButton,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Ink.image(
        image: const NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        child: widget.chat == null ? null : buildChat(context));
  }

  Widget buildChat(BuildContext context) {
    Chat chat = widget.chat!;
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Ink(
            color: const Color.fromRGBO(40, 47, 54, 1),
            height: 68,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: widget.onBackButton,
                  icon: const Icon(Icons.arrow_back, color: Colors.grey),
                ),
                const SizedBox(width: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chat.name, style: const TextStyle(fontSize: 16)),
                    const Text("last seen recently",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                      ),
                      Flexible(
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.phone)),
                      ),
                      Flexible(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20),
              itemCount: chat.messages.length,
              itemBuilder: buildMessageList),
        ),
        Ink(
          color: const Color.fromRGBO(61, 68, 75, 1),
          child: TTextField(
              icon: Icons.send,
              function: () {
                setState(() {
                  chat.messages.add(
                      Message(chat.messageController.text, DateTime.now()));
                  chat.messageController.clear();
                });
              },
              textController: chat.messageController,
              hintText: "Write a message..."),
        ),
      ],
    );
  }

  Widget buildMessageList(BuildContext context, int index) {
    Message message =
        widget.chat!.messages[widget.chat!.messages.length - 1 - index];
    return Container(
      padding: const EdgeInsets.only(right: 100, top: 10),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle_rounded,
            size: 36,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromRGBO(53, 60, 67, 1),
                  boxShadow: const [
                    BoxShadow(
                      spreadRadius: -5,
                      blurRadius: 10,
                      offset: Offset(10, 10),
                    )
                  ]),
              child: Stack(children: [
                Container(
                  padding: const EdgeInsets.only(right: 50, bottom: 5),
                  child: Text(message.text),
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
