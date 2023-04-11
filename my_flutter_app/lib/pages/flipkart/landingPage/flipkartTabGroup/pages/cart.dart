import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/provider/cartItem.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
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
            child: Consumer<CartProvider>(
                builder: ((context, value, child) => ListView.builder(
                    itemCount: value.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SimpleCard(
                          onClick: () {
                            onClickCard(value.products[index]);
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 110,
                                    width: 110,
                                    child: NetWorkImage(
                                      url: value.products[index].productURL,
                                      alignment: Alignment.center,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: Column(children: [
                                    Text(value.products[index].productName),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Count',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(value.products[index].quantity
                                            .toString()),
                                      ],
                                    )
                                  ]),
                                )
                              ]));
                    })))));
  }
}
