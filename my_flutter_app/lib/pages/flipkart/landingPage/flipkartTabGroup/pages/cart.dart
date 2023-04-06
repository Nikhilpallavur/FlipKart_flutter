import 'package:flutter/material.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void onClickCard(Product product) {}

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('cart'));
    // return Container(
    //     child: Consumer<CartProvider>(
    //         builder: ((context, value, child) => ListView.builder(
    //             clipBehavior: Clip.hardEdge,
    //             scrollDirection: Axis.horizontal,
    //             itemCount: value.products.length,
    //             itemBuilder: (BuildContext context, int index) {
    //               return SimpleCard(
    //                 onClick: () {
    //                   onClickCard(value.products[index]);
    //                 },
    //                 child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       SizedBox(
    //                           height: 110,
    //                           width: 110,
    //                           child: NetWorkImage(
    //                             url: value.products[index].productURL,
    //                           )),
    //                       Padding(
    //                         padding: const EdgeInsets.only(top: 10, bottom: 10),
    //                         child: Text(value.products[index].productName),
    //                       ),
    //                     ]),
    //               );
    //             }))));
  }
}
