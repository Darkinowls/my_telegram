import 'package:flutter/material.dart';
import 'mobile/mobile_app.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(40, 47, 54, 1),
        primaryColor: Colors.teal,
        primaryColorLight: Colors.tealAccent,
        iconTheme: const IconThemeData(color: Colors.grey),
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(40, 47, 54, 1)),
      ),
      home:  MobileApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}


