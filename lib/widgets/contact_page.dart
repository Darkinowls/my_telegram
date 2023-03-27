import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contacts_model.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Consumer<ContactsModel>(
            builder: (context, contactsModel, _) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: "contact_${contactsModel.selectedContact!.id}",
                  child: const Icon(Icons.account_circle_rounded, size: 100),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(contactsModel.selectedContact!.name),
                    subtitle: const Text("last seen recently"),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 25,
          color: Theme.of(context).hoverColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(children: [
            ListTile(
              leading: const SizedBox(),
              title: const Text("@telegram tag"),
              subtitle: const Text("Username"),
              onTap: () {},
            ),
            ListTile(
              leading: const SizedBox(),
              title: Text("SEND MESSAGE",
                  style: TextStyle(color: Theme.of(context).primaryColorLight)),
              onTap: () => Navigator.pushReplacementNamed(context, "/chat"),
            ),
          ]),
        ),
        Ink(
          height: 25,
          color: Theme.of(context).hoverColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Photos"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.file_present),
                title: const Text("Files"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.link),
                title: const Text("Shared links"),
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
                leading: const Icon(Icons.share),
                title: const Text("Share contact"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Edit contact"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.delete_forever),
                title: const Text("Delete contact"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.block, color: Colors.red),
                title: const Text("Block contact",
                    style: TextStyle(color: Colors.red)),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
