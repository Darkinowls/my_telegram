import 'package:flutter/material.dart';
import 'package:my_telegram/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(40, 47, 54, 1),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
