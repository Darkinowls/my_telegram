import 'package:flutter/material.dart';

import '../entities/chat.dart';
import '../widgets/telegram_drawer.dart';
import '../widgets/chat_page.dart';
import '../widgets/chat_list.dart';
import '../widgets/t_text_field.dart';
import 'mobile/tabs/message_tab.dart';

class MobileLayout extends StatefulWidget {
  final List<Chat> chatList;
  final Chat? selectedChat;
  final Function(Chat?) setChat;

  const MobileLayout({Key? key,
    required this.chatList,
    required this.selectedChat,
    required this.setChat})
      : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  TextEditingController searchController = TextEditingController();
  // final List<Widget> pages = [
  // ]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TTextField(
            icon: Icons.close,
            function: searchController.clear,
            textController: searchController,
            hintText: 'Search'),
      ),
      drawer: const TelegramDrawer(),
      body: MessageTab(
          chatList: widget.chatList, selectedChat: widget.selectedChat),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.mode),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [],
      // ),
    );
  }
}
