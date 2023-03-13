import 'package:flutter/material.dart';
import 'package:my_telegram/layouts/mobile_layout.dart';
import '../database/chats.dart';
import '../entities/chat.dart';
import '../entities/message.dart';
import 'desktop_layout.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  TextEditingController searchController = TextEditingController();
  Chat? selectedChat;
  List<Chat> chatList = [];
  void setChat(Chat? chat) => setState(() => selectedChat = chat);

  @override
  void initState() {
    super.initState();
    chatList.addAll([amogusChat, warChat, secondOneChat]);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(

      builder: (BuildContext context, BoxConstraints constrains) {
        if (constrains.maxWidth < 600) {
          return MobileLayout(
            chatList: chatList,
            selectedChat: selectedChat,
            setChat: setChat,
          );
        }
        return DesktopLayout(
          chatList: chatList,
          selectedChat: selectedChat,
          setChat: setChat,
        );
      },

    );
  }
}
