import 'package:catalog_app/models/catalogModel.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Muhammad Zuhair";

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(60, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}