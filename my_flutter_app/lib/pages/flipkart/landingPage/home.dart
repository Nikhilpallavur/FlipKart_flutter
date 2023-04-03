// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/button/button.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/flipkartHome/tabs/flipkartHome.dart';
import 'package:my_flutter_app/utils/flipkart/variables/variables.dart';
import '../../../style/flipkart/colors.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/flipkartHome/tabs/tabs.dart';

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
    });
  }

  void onChangeTab(value) {
    print('selectedTab' + value);
    setState(() {
      selectedTab = value ?? '';
    });
  }

  @override
  Widget checkRender() {
    return selectedButton == Flipkart
        ? FilpKartBottomTabRender(selectedTab: selectedTab)
        : Text(Grocery);
  }

  @override
  Widget checkBottom() {
    return selectedButton == Flipkart
        ? FilpKartBottom(callback: onChangeTab)
        : Text('Bottom' + Grocery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        simpleButton(
                            text: Flipkart,
                            onPressed: () => onButtonClick(Flipkart),
                            bgColor: selectedButton == Flipkart
                                ? APP_PRIMARY_COLOR
                                : APP_COLOR,
                            color: selectedButton == Flipkart
                                ? APP_COLOR
                                : APP_TEXT_COLOR,
                            padding: const EdgeInsets.only(
                                left: 55, right: 55, top: 10, bottom: 10)),
                        simpleButton(
                            text: Grocery,
                            onPressed: () => onButtonClick(Grocery),
                            bgColor: selectedButton == Grocery
                                ? APP_PRIMARY_COLOR
                                : APP_COLOR,
                            color: selectedButton == Grocery
                                ? APP_COLOR
                                : APP_TEXT_COLOR,
                            padding: const EdgeInsets.only(
                                left: 55, right: 55, top: 10, bottom: 10)),
                      ],
                    ),
                  ],
                )),
            checkRender()
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
