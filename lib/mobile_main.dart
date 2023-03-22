import 'package:flutter/material.dart';
import 'package:my_telegram/screens/home_screen.dart';

void main() {
  runApp(const MobileApp());
}

class MobileApp extends StatefulWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  State<MobileApp> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> {
  bool isDark = true;

  void switchDarkMode() {
    isDark = !isDark;
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
      home: HomeScreen(switchDarkMode: switchDarkMode, isDark: isDark),
      debugShowCheckedModeBanner: false,
    );
  }
}
