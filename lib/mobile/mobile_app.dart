import 'package:flutter/material.dart';

import '../database/contacts.dart';
import '../entities/abstract/chat.dart';
import '../entities/message.dart';
import '../entities/private_chat.dart';
import '../entities/contact.dart';
import '../widgets/chat_bar.dart';
import '../widgets/chat_list.dart';
import '../widgets/chat_page.dart';
import '../widgets/contact_list.dart';
import '../widgets/contact_page.dart';
import '../widgets/setting_page.dart';
import '../widgets/telegram_drawer.dart';
import '../widgets/t_text_field.dart';

class MobileApp extends StatefulWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  State<MobileApp> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController searchController = TextEditingController();
  Chat? selectedChat;
  final List<Contact> contacts = [];
  int tabIndex = 0;
  final List<Widget> tabs = [];

  void setChat(Chat? chat) => setState(() => selectedChat = chat);

  void sendMessage(Chat chat, String text) {
    chat.messages.add(Message(text, DateTime.now()));
    setState(() {});
  }

  void setDrafted(Chat chat, String? text) {
    chat.drafted = text;
  }

  @override
  void initState() {
    super.initState();
    contacts.addAll([amogus, war, secondOne, chatLessDude]);
    tabs.addAll([
      ChatList(
        contacts: contacts,
        selectedChat: selectedChat,
        onTap: navigateToChat,
      ),
      ContactList(
        contacts: contacts,
        onTap: navigateToContact,
      ),
      const SettingPage(),
    ]);
    tabController = TabController(vsync: this, length: tabs.length);
    tabController.addListener(() {
      setState(() {
        tabIndex = tabController.index;
      });
    });
  }

  void navigateToContact(Contact contact) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text("User info"),
                  ),
                  body: ContactPage(
                      contact: contact, onTap: () => navigateToChat(contact)),
                )));
  }

  void navigateToChat(Contact contact) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      contact.privateChat ??= PrivateChat(messages: []);
      return Scaffold(
        appBar: AppBar(
          title: ChatBar(
            chat: contact.privateChat!,
            onTap: () => navigateToContact(contact),
          ),
        ),
        body: ChatPage(
          sendMessage: (String text) => sendMessage(contact.privateChat!, text),
          chat: contact.privateChat!,
          setDrafted: (String? text) => setDrafted(contact.privateChat!, text),
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TTextField(
          buttonIcon: Icons.close,
          hintText: 'Search',
          onButton: (String text) =>
              setState(() => searchController.text = text),
          onDrafted: (String? text) =>
              setState(() => searchController.text = text!),
        ),
      ),
      drawer: const TelegramDrawer(),
      body:
      ChatList(
        contacts: contacts,
        selectedChat: selectedChat,
        onTap: navigateToChat,
      ),
      // TabBarView(
      //   controller: tabController,
      //   children: tabs,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          tabIndex = 1;
          tabController.animateTo(tabIndex);
        }),
        child: const Icon(Icons.mode),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail_sharp),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: tabIndex,
        onTap: (int index) => setState(() {
          tabIndex = index;
          tabController.animateTo(index);
        }),
      ),
    );
  }
}
