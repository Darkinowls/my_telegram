import 'package:flutter/material.dart';
import 'package:my_telegram/models/dark_mode_model.dart';
import 'package:provider/provider.dart';

class TelegramDrawer extends StatelessWidget {
  const TelegramDrawer({Key? key}) : super(key: key);

  DarkModeModel provideDarkModeModel(BuildContext context){ // using a function
    return Provider.of<DarkModeModel>(context, listen: false);
  }

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
            // changes darkMode!
            onTap: provideDarkModeModel(context).switchDarkMode,
            leading: const Icon(Icons.nightlight_outlined),
            title: const Text("Night mode"),
            trailing: Switch(
                value: provideDarkModeModel(context).isDark,
                onChanged: (bool value) =>
                    provideDarkModeModel(context).switchDarkMode()),
          ),
        ],
      ),
    );
  }
}
