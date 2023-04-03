
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

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
        return Text('Home');
        break;
      case 'Categories':
        return Text('Categories');
        break;
      case 'Account':
        return Text('Account');
        break;
      default:
        return Text('Home');
    }
  }
}
