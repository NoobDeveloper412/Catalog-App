import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 3;
  final String name = 'Muhammad Zuhair';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
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
