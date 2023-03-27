import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entities/abstract/chat.dart';
import '../entities/message.dart';
import '../models/contacts_model.dart';
import 'cloud_painter.dart';
import 't_text_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ContactsModel contactsModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    contactsModel = Provider.of<ContactsModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Ink.image(
        image: const NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        child: contactsModel.selectedContact?.chat == null
            ? null
            : buildChat(context));
  }

  Widget buildChat(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Consumer<ContactsModel>(builder: (context, contactsM, _) {
            Chat chat = contactsM.selectedContact!.chat!;
            return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(25),
                itemCount: chat.messages.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildMessageList(context, index, chat));
          }),
        ),
        Ink(
          child: TTextField(
              buttonIcon: Icons.send,
              onButton: contactsModel.sendMessageToSelectedContact,
              onDrafted: contactsModel.setDraftedToSelectedMessage,
              hintText: "Write a message...",
              text: contactsModel.selectedContact!.chat?.drafted),
        ),
      ],
    );
  }

  Widget buildMessageList(BuildContext context, int index, Chat chat) {
    int reversedIndex = chat.messages.length - 1 - index;
    Message? message = chat.messages[reversedIndex];
    if (message == null) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.only(right: 25, top: 10),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle_rounded,
            size: 36,
            color: Colors.white,
          ),
          const SizedBox(width: 30),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 10,
                  offset: Offset(-10, 10),
                )
              ]),
              child: CustomPaint(
                painter: CloudPainter(context),
                child: Stack(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 50, bottom: 5),
                    child: Text(message.text),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(message.getCreatedTime(),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
