// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_flutter_app/components/flipkart/button/button.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/flipkartTabGroup/tabs/flipkartHome.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/groceryTab/main.dart';
import 'package:my_flutter_app/utils/flipkart/variables/tabVariables.dart';
import '../../../style/flipkart/colors.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/flipkartTabGroup/tabs/tabs.dart';

var Flipkart = 'Flipkart';
var Grocery = 'Grocery';

class MyHomePageMain extends StatefulWidget {
  const MyHomePageMain({super.key});

  @override
  State<MyHomePageMain> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePageMain> {
  var selectedButton = Flipkart;
  var selectedTab = BOTTOM_TABS.Home.name;

  void onButtonClick(value) {
    setState(() {
      selectedButton = value;
      selectedTab = BOTTOM_TABS.Home.name;
    });
  }

  void onChangeTab(value) {
    setState(() {
      selectedTab = value ?? '';
    });
  }

  @override
  Widget checkRender() {
    return selectedButton == Flipkart
        ? FilpKartBottomTabRender(selectedTab: selectedTab)
        : GroceryPage();
  }

  @override
  Widget checkBottom() {
    return selectedButton == Flipkart
        ? FilpKartBottom(callback: onChangeTab)
        : Container(
            height: .5,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            selectedTab == BOTTOM_TABS.Home.name
                ? Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                text: Flipkart,
                                onPressed: () => onButtonClick(Flipkart),
                                bgColor: selectedButton == Flipkart
                                    ? APP_PRIMARY_COLOR
                                    : APP_PRIMARY_BG_COLOR,
                                color: selectedButton == Flipkart
                                    ? APP_COLOR
                                    : APP_TEXT_COLOR,
                                padding: const EdgeInsets.only(
                                    left: 35, right: 35, top: 10, bottom: 10),
                                icon: Icon(
                                  Icons.shopping_bag,
                                  color: selectedButton == Flipkart
                                      ? Colors.yellow
                                      : Colors.blue,
                                  size: 20.0,
                                )),
                            CustomIconButton(
                                text: Grocery,
                                onPressed: () => onButtonClick(Grocery),
                                bgColor: selectedButton == Grocery
                                    ? APP_GREEN_COLOR
                                    : APP_PRIMARY_BG_COLOR,
                                color: selectedButton == Grocery
                                    ? APP_COLOR
                                    : APP_TEXT_COLOR,
                                padding: const EdgeInsets.only(
                                    left: 35, right: 35, top: 10, bottom: 10),
                                icon: Icon(
                                  Icons.store,
                                  color: selectedButton == Flipkart
                                      ? Colors.green
                                      : Colors.yellow,
                                  size: 20.0,
                                )),
                          ],
                        ),
                      ],
                    ))
                : Container(
                    height: 0,
                  ),
            Expanded(
                //  scrollDirection: Axis.vertical,
                child: SingleChildScrollView(child: checkRender())),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: APP_ACTIVE_COLOR,
        child: checkBottom(),
      ),
    );
  }
}
