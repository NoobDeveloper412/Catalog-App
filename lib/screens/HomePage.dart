import 'package:catalog_app/models/catalogModel.dart';
import 'package:catalog_app/widgets/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Muhammad Zuhair";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemWidget(item: CatalogModel.items[index],);
        },
      ),
      drawer: const Drawer(),
    );
  }
}
