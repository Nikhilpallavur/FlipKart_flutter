import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/provider/cartItem.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/firebase/product.dart';
import 'package:my_flutter_app/utils/flipkart/variables/firebase/firebaseVariable.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void onClickCard(Product product) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: MAIN_PADDING_HORIZONTAL),
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: StreamBuilder<List<Product>>(
                stream: getCartProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final products = snapshot.data!;
                    CartProvider().updateList(products);
                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SimpleCard(
                              onClick: () {
                                onClickCard(products[index]);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 110,
                                        width: 110,
                                        child: NetWorkImage(
                                          url: products[index].url,
                                          alignment: Alignment.center,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(products[index].productName),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Count',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text(products[index]
                                                      .quantity
                                                      .toString()),
                                                ),
                                              ],
                                            )
                                          ]),
                                    )
                                  ]));
                        });
                  }
                  return const Text('No data');
                })));
  }
}
