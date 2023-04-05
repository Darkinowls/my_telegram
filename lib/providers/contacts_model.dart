import 'package:flutter/cupertino.dart';
import 'package:my_telegram/entities/private_chat.dart';

import '../database/contacts.dart';
import '../entities/contact.dart';
import '../entities/message.dart';

class ContactsModel extends ChangeNotifier {
  final List<Contact> _contacts = [amogus, war, secondOne, chatLessDude];
  Contact? _selectedContact; // Consumer<T> and Selector<T,V>

  List<Contact> get contacts => _contacts;

  Contact? get selectedContact => _selectedContact;

  void createSelectedContactChatIfNotExists() {
    if (_selectedContact?.chat != null) return;
    _selectedContact?.chat = PrivateChat(messages: []);
    notifyListeners();
  }

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void removeContact(Contact contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

  void setSelectedContactByIndex(int index) {
    _selectedContact = _contacts[index];
    notifyListeners();
  }

  void sendMessageToSelectedContact(String text) {
    _selectedContact?.chat?.messages.add(Message(text, DateTime.now()));
    notifyListeners();
  }

  void setDraftedToSelectedMessage(String? text) {
    _selectedContact?.chat?.drafted = text;
    notifyListeners();
  }
}
