import 'package:flutter/material.dart';
import 'package:my_telegram/models/contacts_model.dart';
import 'package:provider/provider.dart';

import '../entities/contact.dart';
import '../models/search_model.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  late final ContactsModel contactsModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    contactsModel = Provider.of<ContactsModel>(context, listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactsModel.contacts.length,
      itemBuilder: buildContactList,
    );
  }

  Widget buildContactList(BuildContext context, int index) {
    Contact contact = contactsModel.contacts[index];
    return Consumer<SearchModel>(
      builder: (context, searchModel, _) => Visibility(
        visible:
            searchModel.text.isEmpty || contact.name.contains(searchModel.text),
        child: ListTile(
          onTap: () => Navigator.pushReplacementNamed(context, "/chat"),
          leading: Hero(
              tag: "contact_${contact.id}",
              child: const Icon(Icons.account_circle_rounded, size: 40)),
          title: Text(contact.name),
          subtitle: const Text("last seen recently"),
        ),
      ),
    );
  }
}
