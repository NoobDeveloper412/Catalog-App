// import 'package:catalog_app/models/cartModel.dart';
// import 'package:catalog_app/models/catalogModel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class AddToCart extends StatefulWidget {
//   final Item catalog;
//
//   const AddToCart({
//     Key? key,
//     required this.catalog,
//   }) : super(key: key);
//
//
//
//   @override
//   _AddToCartState createState() => _AddToCartState();
// }
//
// class _AddToCartState extends State<AddToCart> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   final _cart = CartModel();
//
//   @override
//   Widget build(BuildContext context) {
//     bool isInCart = _cart.items.contains(widget.catalog);
//     return ElevatedButton(
//       onPressed: () {
//         if (!isInCart) {
//           isInCart = isInCart.toggle();
//           // final _catalog = CatalogModel();
//           // print(_catalog);
//
//           // _cart.catalog = _catalog;
//           // _cart.add(widget.catalog);
//           // setState(() {});
//         }
//       },
//       style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
//           shape: MaterialStateProperty.all(
//             StadiumBorder(),
//           )),
//       child: isInCart
//           ? const Icon(Icons.done)
//           : const Icon(CupertinoIcons.cart_badge_plus),
//     );
//   }
// }
