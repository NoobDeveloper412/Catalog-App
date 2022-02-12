import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var products;
  var foundProducts;

  var newResults;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    products =  CatalogModel.items;

    setState(() {
      foundProducts = products;
    });  }

  void searchProduct(String value) {
    var results = [];
    if (value.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = foundProducts;
    } else {
      for (Object product in products) {
        results.add(product);
      }

      newResults = results
          .where((product) =>
              product.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }

    // Refresh the UIR
    setState(() {
      foundProducts = newResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: context.canvasColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  TextField(
                    onChanged: (value) => searchProduct(value),
                    decoration: const InputDecoration(
                        labelText: 'Search...', suffixIcon: Icon(Icons.search)),
                  ),
                  if (CatalogModel.items.isNotEmpty)
                    CatalogList(
                      foundProducts: foundProducts,
                    ).py16().expand()
                  else
                    const CircularProgressIndicator().centered().expand(),
                ],
              ),
            ),
          )),
    );
  }
}
