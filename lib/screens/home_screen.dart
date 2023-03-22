import 'package:flutter/material.dart';

import '../database/contacts.dart';
import '../entities/abstract/chat.dart';
import '../entities/message.dart';
import '../entities/private_chat.dart';
import '../entities/contact.dart';
import '../widgets/chat_list.dart';
import '../widgets/contact_list.dart';
import '../widgets/setting_page.dart';
import '../widgets/telegram_drawer.dart';
import '../widgets/t_text_field.dart';
import 'chat_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function() switchDarkMode;
  final bool isDark;

  const HomeScreen(
      {required this.switchDarkMode, Key? key, required this.isDark})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController tabController;
  TextEditingController searchController = TextEditingController();
  Chat? selectedChat;
  final List<Contact> contacts = [];
  int tabIndex = 0;
  final List<BottomNavigationBarItem> tabs = [];

  void setChat(Chat? chat) => setState(() => selectedChat = chat);

  void sendMessage(Chat chat, String text) {
    chat.messages.add(Message(text, DateTime.now()));
    setState(() {});
  }

  void setDrafted(Chat chat, String? text) {
    chat.drafted = text;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    contacts.addAll([amogus, war, secondOne, chatLessDude]);
    tabs.addAll(
      const <BottomNavigationBarItem>[
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
    );
    searchController.addListener(() {
      setState(() {});
    });
    tabController = TabController(vsync: this, length: tabs.length);
    tabController.addListener(() {
      tabIndex = tabController.index;
      setState(() {});
    });
  }

  void navigateToContact(Contact contact) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContactScreen(
                  setDrafted: setDrafted,
                  sendMessage: sendMessage,
                  contact: contact,
                  navigateToChat: navigateToChat,
                )));
  }

  void navigateToChat(Contact contact) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      contact.privateChat ??= PrivateChat(messages: []);
      return ChatScreen(
        setDrafted: setDrafted,
        sendMessage: sendMessage,
        contact: contact,
        navigateToContact: navigateToContact,
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
          onButton: (String text) {},
          onDrafted: (String? text) {
            searchController.text = text ?? "";
          },
        ),
      ),
      drawer: TelegramDrawer(
          switchDarkMode: widget.switchDarkMode, isDark: widget.isDark),
      body: TabBarView(
        controller: tabController,
        children: [
          Tab(
              child: ChatList(
                  contacts: contacts,
                  selectedChat: selectedChat,
                  onTap: navigateToChat,
                  searchController: searchController)),
          Tab(
              child: ContactList(
            contacts: contacts,
            onTap: navigateToContact,
            searchController: searchController,
          )),
          const Tab(child: SettingPage())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          tabIndex = 1;
          tabController.animateTo(tabIndex);
        }),
        child: const Icon(Icons.mode),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: tabs,
        currentIndex: tabIndex,
        onTap: (int index) {
          tabIndex = index;
          tabController.animateTo(index);
          // setState((){});
        },
      ),
    );
  }
}
