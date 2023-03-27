import 'package:flutter/cupertino.dart';

import '../screens/chat_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/home_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes() => {
        '/': (context) => const HomeScreen(),
        '/chat': (context) => const ChatScreen(),
        '/contact': (context) => const ContactScreen()
      };
}
