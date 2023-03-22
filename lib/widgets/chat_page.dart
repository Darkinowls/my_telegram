import 'package:flutter/material.dart';

import '../entities/abstract/chat.dart';
import '../entities/message.dart';
import 't_text_field.dart';

class ChatPage extends StatefulWidget {
  final Chat? chat;
  final Function(String) sendMessage;
  final Function(String?) setDrafted;

  const ChatPage({
    required this.chat,
    Key? key,
    required this.sendMessage, required this.setDrafted,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Chat? chat;

  @override
  void initState() {
    chat = widget.chat;
    super.initState();
  }

  void sendMessage(String text) {
    widget.sendMessage(text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Ink.image(
        image: const NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        child: chat == null ? null : buildChat(context));
  }

  Widget buildChat(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20),
              itemCount: chat!.messages.length,
              itemBuilder: buildMessageList),
        ),
        Ink(
          color: const Color.fromRGBO(61, 68, 75, 1),
          child: TTextField(
              buttonIcon: Icons.send,
              onButton: sendMessage,
              onDrafted: widget.setDrafted,
              hintText: "Write a message...",
              text: chat?.drafted),
        ),
      ],
    );
  }

  Widget buildMessageList(BuildContext context, int index) {
    Message? message =
        widget.chat!.messages[widget.chat!.messages.length - 1 - index];
    if (message == null) return const SizedBox.shrink();
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
