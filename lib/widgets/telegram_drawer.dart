import 'package:flutter/material.dart';

class TelegramDrawer extends StatelessWidget {
  final Function() switchDarkMode;
  final bool isDark;

  const TelegramDrawer({Key? key, required this.switchDarkMode, required this.isDark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              accountEmail: const Text("@userTag"),
              accountName: const Text("User nickname"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
              )),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.group),
            title: const Text("New Group"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.contact_mail_sharp),
            title: const Text("Contacts"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
          ListTile(
            onTap: switchDarkMode,
            leading: const Icon(Icons.nightlight_outlined),
            title: const Text("Night mode"),
            trailing: Switch(
                value: isDark, onChanged: (bool value) => switchDarkMode()),
          ),
        ],
      ),
    );
  }
}
