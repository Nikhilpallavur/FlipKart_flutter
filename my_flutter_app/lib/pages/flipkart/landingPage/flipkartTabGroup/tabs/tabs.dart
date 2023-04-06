import 'package:flutter/material.dart';
import 'package:my_flutter_app/provider/cartItem.dart';
import 'package:my_flutter_app/style/flipkart/colors.dart';
import 'package:my_flutter_app/utils/flipkart/variables/tabVariables.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class FilpKartBottom extends StatefulWidget {
  final Function callback;
  const FilpKartBottom({super.key, required this.callback});

  @override
  State<FilpKartBottom> createState() => _FilpKartBottomState();
}

class _FilpKartBottomState extends State<FilpKartBottom> {
  var _curIndex = 0;
  var selectedTab = 'Home';

  void updateState(value) {
    setState(() {
      selectedTab = value;
    });
    widget.callback(value);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      items: [
        BottomButton(
            activeIcon: Icons.home_outlined,
            icon: Icons.home_outlined,
            name: BOTTOM_TABS.Home.name),
        BottomButton(
            activeIcon: Icons.book_outlined,
            icon: Icons.book_outlined,
            name: BOTTOM_TABS.Categories.name),
        BottomButton(
            activeIcon: Icons.assignment_ind_outlined,
            icon: Icons.assignment_ind_outlined,
            name: BOTTOM_TABS.Account.name),
        BottomNavigationBarItem(
            icon: Consumer<CartProvider>(
                builder: ((context, value, child) => value.products.length != 0
                    ? Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              badges.Badge(
                                badgeStyle: const badges.BadgeStyle(
                                  badgeColor: Colors.red,
                                ),
                                position: badges.BadgePosition.topEnd(top: -14),
                                badgeContent: Text(
                                  value?.products?.length?.toString() ?? '0',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ]),
                      )
                    : Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                        weight: 800,
                        color: APP_TEXT_COLOR,
                      ))),
            label: BOTTOM_TABS.Cart.name,
            activeIcon: Icon(
              Icons.shopping_cart_outlined,
              size: 20,
              color: APP_ACTIVE_COLOR,
            )),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _curIndex,
      onTap: (index) {
        _curIndex = index;
        switch (_curIndex) {
          case 0:
            updateState(BOTTOM_TABS.Home.name);
            break;
          case 1:
            updateState(BOTTOM_TABS.Categories.name);
            break;
          case 2:
            updateState(BOTTOM_TABS.Account.name);
            break;
          case 3:
            updateState(BOTTOM_TABS.Cart.name);
            break;
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  BottomButton({icon, activeIcon, name}) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          size: 20,
          weight: 800,
          color: APP_ICON_DEFAULT_COLOR,
        ),
        label: name,
        activeIcon: Icon(
          activeIcon,
          size: 20,
          color: APP_ACTIVE_COLOR,
        ));
  }
}
// ignore: non_constant_identifier_names

