import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entities/abstract/chat.dart';
import '../entities/contact.dart';
import '../widgets/chat_bar.dart';
import '../widgets/chat_page.dart';
import '../widgets/pop_back_arrow.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopBackArrowButton(),
        title: const ChatBar(),
      ),
      body: const ChatPage(),
    );
  }
}
