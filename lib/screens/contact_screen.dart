import 'package:flutter/material.dart';

import '../widgets/contact_page.dart';
import '../widgets/pop_back_arrow.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopBackArrowButton(),
        title: Text("User info",
            style: TextStyle(color: Theme.of(context).focusColor)),
      ),
      body: const ContactPage(),
    );
  }
}
