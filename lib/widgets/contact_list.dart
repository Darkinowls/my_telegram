import 'package:flutter/material.dart';

import '../entities/contact.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts;
  final Function(Contact contact) onTap;
  final TextEditingController searchController;

  const ContactList(
      {Key? key,
      required this.contacts,
      required this.onTap,
      required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: buildContactList,
    );
  }

  Widget buildContactList(BuildContext context, int index) {
    Contact contact = contacts[index];
    return Visibility(
      visible: searchController.text.isEmpty ||
          contact.name.contains(searchController.text),
      child: ListTile(
        onTap: () => onTap(contact),
        leading: Hero(
            tag: "contact_${contact.id}",
            child: const Icon(Icons.account_circle_rounded, size: 40)),
        title: Text(contact.name),
        subtitle: const Text("last seen recently"),
      ),
    );
  }
}
