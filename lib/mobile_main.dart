import 'package:flutter/material.dart';
import 'package:my_telegram/providers/contacts_model.dart';
import 'package:my_telegram/providers/dark_mode_model.dart';
import 'package:my_telegram/providers/search_model.dart';
import 'package:my_telegram/routing/apt_routes.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(providers: [ // multiProvider
      ChangeNotifierProvider(create: (_) => DarkModeModel()),
      ChangeNotifierProvider(create: (_) => SearchModel()),
      ChangeNotifierProvider(create: (_) => ContactsModel()),
    ], child: const MobileApp()),
  );
}

class MobileApp extends StatelessWidget {
  const MobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeModel>( // rebuilds everything!
      builder: (context, darkModeModel, child) => MaterialApp(
        theme: darkModeModel.isDark
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
        initialRoute: '/',
        routes: AppRoutes.getRoutes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
