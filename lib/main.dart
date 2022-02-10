import 'package:catalog_app/screens/HomePage.dart';
import 'package:catalog_app/screens/LoginPage.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: DefaultTheme.lightTheme(context),
      darkTheme: DefaultTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: DefaultRoutes.homeRoute,

      routes: {
        "/": (context) => LoginPage(),
        DefaultRoutes.homeRoute: (context) => HomePage(),
        DefaultRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}