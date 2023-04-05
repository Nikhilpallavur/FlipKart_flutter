import 'package:flutter/material.dart';
import 'package:my_flutter_app/provider/cartItem.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('cart'),
    );
  }
}
