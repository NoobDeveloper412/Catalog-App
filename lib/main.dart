import 'package:catalog_app/screens/HomePage.dart';
import 'package:catalog_app/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_catalog/screens/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BuildContext and Context are used because as we know that the flutter language works on a tree design, these works as a data locator
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      initialRoute: '/login',
      routes:{
       "/home":(context) => HomePage(),
        "/login":(context) => LoginPage(),
      },
    );
  }
}