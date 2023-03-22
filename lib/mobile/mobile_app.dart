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
  final Function(bool setDark) setDark;
  final bool isDark;

  const MobileApp({required this.setDark, Key? key, required this.isDark}) : super(key: key);

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
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // Pop off all the screens until the first screen
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                    ),
                    title:  Text("User info",
                        style: TextStyle(color: Theme.of(context).focusColor)),
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Pop off all the screens until the first screen
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
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
          onButton: (String text) {},
          onDrafted: (String? text) {
            searchController.text = text ?? "";
          },
        ),
      ),
      drawer: TelegramDrawer(setDark: widget.setDark, isDark: widget.isDark),
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
