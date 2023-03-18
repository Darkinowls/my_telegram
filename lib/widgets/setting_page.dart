import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.account_circle_rounded, size: 100),
              Expanded(
                child: ListTile(
                  title: Text("My name"),
                  subtitle: Text("+380 99 188 111 22"),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 25,
          color: Theme.of(context).hoverColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.account_box_rounded),
                title: const Text("Edit profile"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Notifications and sounds"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text("Privacy and security"),
                onTap: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 25,
          color: Theme.of(context).hoverColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.chat_bubble),
                title: const Text("Chat settings"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.folder),
                title: const Text("Folders"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.call),
                title: const Text("Call settings"),
                onTap: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 25,
          color: Theme.of(context).hoverColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.question_mark),
                title: const Text("Ask question"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.newspaper),
                title: const Text("Features"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text("Telegram FAQ"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
