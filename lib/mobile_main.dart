import 'package:flutter/material.dart';
import 'mobile/mobile_app.dart';

void main() {
  runApp(const MyTelegram());
}

class MyTelegram extends StatefulWidget {
  const MyTelegram({Key? key}) : super(key: key);

  @override
  State<MyTelegram> createState() => _MyTelegramState();
}

class _MyTelegramState extends State<MyTelegram> {
  bool isDark = true;

  void setDark(bool setDark) {
    isDark = setDark;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: const Color.fromRGBO(48, 55, 62, 1),
              focusColor: Colors.white,
              primaryColor: Colors.teal,
              primaryColorLight: Colors.tealAccent,
              iconTheme: const IconThemeData(color: Colors.grey),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.grey),
                  color: Color.fromRGBO(40, 47, 54, 1)),
            )
          : ThemeData(
              scaffoldBackgroundColor: Colors.white,
              focusColor: Colors.black,
              primarySwatch: Colors.teal,
              primaryColorLight: Colors.tealAccent,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.grey),
                color: Colors.white70,
              ),
            ),
      home: MobileApp(setDark: setDark, isDark: isDark),
      debugShowCheckedModeBanner: false,
    );
  }
}
