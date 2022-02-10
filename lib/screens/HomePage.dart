import 'dart:convert';

import 'package:catalog_app/models/catalogModel.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  late final List<Map<String, dynamic>> _allProducts = [
    {
      "id": 1,
      "name": "iPhone 12 Pro",
      "desc": "Apple iPhone 12th generation",
      "price": 999,
      "color": "#33505a",
      "image":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021661000"
    },
    {
      "id": 2,
      "name": "Pixel 5",
      "desc": "Google Pixel phone 5th generation",
      "price": 699,
      "color": "#00ac51",
      "image":
          "https://www.telstra.com.au/content/dam/tcom/lego/2020/plans-devices/mobiles/google-pixel-5/shared-google-pixel-5-black-05-900x1200.png"
    },
    {
      "id": 3,
      "name": "M1 Macbook Air",
      "desc": "Apple Macbook air with apple silicon",
      "price": 1099,
      "color": "#e0bfae",
      "image":
          "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP825/macbookair.png"
    },
    {
      "id": 4,
      "name": "Playstation 5",
      "desc": "Sony Playstation 5th generation",
      "price": 500,
      "color": "#544ee4",
      "image":
          "https://i1.wp.com/freepngimages.com/wp-content/uploads/2020/07/Playstation-5-games-console-transparent-background-png-image.png?fit=1000%2C1000"
    },
    {
      "id": 5,
      "name": "Airpods Pro",
      "desc": "Apple Aipods Pro 1st generation",
      "price": 200,
      "color": "#e3e4e9",
      "image":
          "https://crdms.images.consumerreports.org/c_lfill,w_598/prod/products/cr/models/400116-wireless-portable-headphones-apple-airpods-pro-10009323.png"
    },
    {
      "id": 6,
      "name": "iPad Pro",
      "desc": "Apple iPad Pro 2020 edition",
      "price": 799,
      "color": "#f73984",
      "image":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/ipad-pro-12-select-wifi-silver-202003_FMT_WHH?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1583551131102"
    },
    {
      "id": 7,
      "name": "Galaxy S21 Ultra",
      "desc": "Samsung Galaxy S21 Ultra 2021 edition",
      "price": 1299,
      "color": "#1c1c1c",
      "image":
          "https://lh3.googleusercontent.com/qRQPjHrhRVIs-xnfNSyiPXOH2vH97ylMacgbTKebqJtRfNH3LlYo8pN-5igsLDWUH62tGl5zNpTsl5xd8SprzGmXoCEmWFOi2-2cQVGS-r3PaRXHt62DmJHq-jrYX0UQvWZ9BA=s800-c"
    },
    {
      "id": 8,
      "name": "Galaxy S21",
      "desc": "Samsung Galaxy S21 2021 edition",
      "price": 899,
      "color": "#7c95eb",
      "image":
          "https://images.samsung.com/is/image/samsung/p6pim/za/galaxy-s21/gallery/za-clear-cover-galaxy-s21-5g-ef-qg991ttegww-363168624"
    }
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundProducts = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundProducts = _allProducts;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allProducts;
    } else {
      results = _allProducts
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundProducts = results;
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
            backgroundColor: DefaultTheme.creamColor,
            body: SafeArea(
              child: Container(
                padding: Vx.m32,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Catalog App"
                          .text
                          .xl5
                          .bold
                          .color(DefaultTheme.darkBluishColor)
                          .make(),
                      "Trending products".text.xl2.make(),
                      TextField(
                        onChanged: (value) => _runFilter(value),
                        decoration: const InputDecoration(
                            labelText: 'Search', suffixIcon: Icon(Icons.search)),
                      ),
                      if (_foundProducts.isNotEmpty)
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _foundProducts.length,
                          itemBuilder: (context, index) => VxBox(
                              child: Row(
                                children: [
                                  CatalogImage(
                                    image: _foundProducts[index]['image'],
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _foundProducts[index]['name'],
                                      ),

                                      Text(
                                        _foundProducts[index]['desc'],
                                      ),
                                      10.heightBox,
                                      ButtonBar(
                                        alignment: MainAxisAlignment.spaceBetween,
                                        buttonPadding: EdgeInsets.zero,
                                        children: [
                                          Text(
                                              "\$${_foundProducts[index]['price']}"),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  DefaultTheme.darkBluishColor,
                                                ),
                                                // shape: MaterialStateProperty.all(
                                                //   const StadiumBorder(),
                                                // )
                                              ),
                                            child: "Buy".text.make(),
                                          )
                                        ],
                                      ).pOnly(right: 8.0)
                                    ],
                                  ))
                                ],
                              ),
                            ).white.rounded.square(150).make().py16(),
                        )
                    ],
                  ),
                ),
              ),
            )));
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(DefaultTheme.creamColor).make().p16().w40(context);
  }
}
