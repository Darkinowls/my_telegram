import 'package:flutter/material.dart';

import '../entities/contact.dart';

class ContactList extends StatefulWidget {
  final List<Contact> contacts;
  final Function(Contact contact) onTap;

  const ContactList({Key? key, required this.contacts, required this.onTap})
      : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.contacts.length,
      itemBuilder: buildContactList,
    );
  }

  Widget buildContactList(BuildContext context, int index) {
    Contact contact = widget.contacts[index];
    return ListTile(
      onTap: () => widget.onTap(contact),
      leading: Hero(
          tag: "contact_${contact.id}",
          child: const Icon(Icons.account_circle_rounded, size: 40)),
      title: Text(contact.name),
      subtitle: const Text("last seen recently"),
    );
  }
}
