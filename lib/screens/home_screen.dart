import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entities/abstract/chat.dart';
import '../models/search_model.dart';
import '../widgets/chat_list.dart';
import '../widgets/contact_list.dart';
import '../widgets/setting_page.dart';
import '../widgets/telegram_drawer.dart';
import '../widgets/t_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  Chat? selectedChat;
  int tabIndex = 0;
  final List<BottomNavigationBarItem> tabs = [];

  @override
  void initState() {
    super.initState();
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
    tabController = TabController(vsync: this, length: tabs.length);
    tabController.addListener(() {
      tabIndex = tabController.index;
      setState(() {});
    });
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
            Provider.of<SearchModel>(context, listen: false).text = text;
          },
        ),
      ),
      drawer: const TelegramDrawer(),
      body: TabBarView(
        controller: tabController,
        children: const [
          Tab(child: ChatList()),
          Tab(child: ContactList()),
          Tab(child: SettingPage())
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
