// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/flipkartTabGroup/pages/account.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/flipkartTabGroup/pages/cart.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/flipkartTabGroup/pages/category.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/flipkartTabGroup/pages/home.dart';

import '../../../../../utils/flipkart/variables/variables.dart';

class FilpKartBottomTabRender extends StatefulWidget {
  final String selectedTab;
  const FilpKartBottomTabRender({super.key, required this.selectedTab});

  @override
  State<FilpKartBottomTabRender> createState() => _FilpKartRenderState();
}

class _FilpKartRenderState extends State<FilpKartBottomTabRender> {
  // String home = BOTTOM_TABS.Home.name;
  // String categories = BOTTOM_TABS.Categories.name;
  // String account = BOTTOM_TABS.Account.name;

  @override
  Widget build(BuildContext context) {
    // print('selectedTab' + widget.selectedTab);

    switch (widget.selectedTab.toString()) {
      case 'Home':
        return const Home();

      case 'Categories':
        return const Category();

      case 'Account':
        return const Account();

      case 'Cart':
        return const CartPage();

      default:
        return const Home();
    }
  }
}
