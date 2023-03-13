import 'package:flutter/material.dart';
import 'package:my_telegram/layouts/desktop_layout.dart';
import 'package:my_telegram/layouts/responsive_layout.dart';

import 'layouts/mobile_layout.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(40, 47, 54, 1),
        primaryColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.grey),
        appBarTheme: const AppBarTheme(color: Colors.transparent),
      ),
      home: const ResponsiveLayout(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
