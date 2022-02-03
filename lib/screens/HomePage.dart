import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
final int days  = 3;
final String name ='Muhammad Zuhair';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text('Catalog App'),
      ),
      body: Center(
        child: Container(
            child: Text("Welcome to the day ${days} by ${name}"),
      ),
    ),
    drawer: Drawer(),
    );
  }
}
