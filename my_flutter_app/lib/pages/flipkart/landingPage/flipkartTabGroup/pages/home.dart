import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/listProducts/horizontalList.dart';
import 'package:my_flutter_app/provider/cartItem.dart';
import 'package:my_flutter_app/style/flipkart/colors.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/variables/variables.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = [];
  @override
  void initState() {
    for (var i = 0; i < 100; i++) {
      products.add(Product(
          i, "Product $i", DUMMY_IMAGES[i % DUMMY_IMAGES.length], "100$i"));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SimpleHorizontalList(
          listItems: products,
          onClickItem: (data) => context.read<CartProvider>().add(data)),
      SimpleHorizontalList(
          listItems: products,
          onClickItem: (data) => context.read<CartProvider>().add(data)),
      SimpleHorizontalList(
          listItems: products,
          onClickItem: (data) => context.read<CartProvider>().add(data)),
      SimpleHorizontalList(
          listItems: products,
          onClickItem: (data) => context.read<CartProvider>().add(data)),
      SimpleHorizontalList(
          listItems: products,
          onClickItem: (data) => context.read<CartProvider>().add(data)),
      SimpleHorizontalList(
          listItems: products,
          onClickItem: (data) => context.read<CartProvider>().add(data)),
      SimpleHorizontalList(
          listItems: products,
          onClickItem: (data) => context.read<CartProvider>().add(data)),
      SimpleHorizontalList(
          listItems: products,
          onClickItem: (data) => context.read<CartProvider>().add(data))
    ]);
  }
}
