import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entities/chat.dart';
import '../widgets/telegram_drawer.dart';
import '../widgets/chat_page.dart';
import '../widgets/chat_list.dart';
import '../widgets/t_text_field.dart';

class DesktopLayout extends StatefulWidget {
  final List<Chat> chatList;
  final Chat? selectedChat;
  final Function(Chat?) setChat;

  const DesktopLayout(
      {Key? key,
      required this.chatList,
      required this.selectedChat,
      required this.setChat})
      : super(key: key);

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      drawer: const TelegramDrawer(),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => setState(
                        () => scaffoldKey.currentState!.openDrawer(),
                      ),
                      icon: const Icon(
                        Icons.menu,
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
                                hintText: 'Search'))),
                  ],
                ),
                Expanded(
                  child: ChatList(
                    chatList: widget.chatList,
                    selectedChat: widget.selectedChat,
                    clickOnTile: widget.setChat,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: ChatPage(
                chat: widget.selectedChat,
                onBackButton: () => widget.setChat(null),
              ))
        ],
      ),
    );
  }
}
