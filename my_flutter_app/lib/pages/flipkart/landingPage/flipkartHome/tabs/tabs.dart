import 'package:flutter/material.dart';
import 'package:my_flutter_app/style/flipkart/colors.dart';
import 'package:my_flutter_app/utils/flipkart/variables/variables.dart';

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
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
            color: APP_TEXT_COLOR,
          ),
          label: BOTTOM_TABS.Home.name,
          activeIcon: Icon(
            Icons.home,
            size: 30,
            color: APP_ACTIVE_COLOR,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book,
            size: 30,
            color: APP_TEXT_COLOR,
          ),
          label: BOTTOM_TABS.Categories.name,
          // title: Text(
          //   "Articles",
          //   style: TextStyle(
          //       fontSize: 30, color: _curIndex == 1 ? RED : APP_TEXT_COLOR),
          // ),
          activeIcon: Icon(
            Icons.book,
            size: 30,
            color: APP_ACTIVE_COLOR,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assignment_ind,
            size: 30,
            color: APP_TEXT_COLOR,
          ),
          label: BOTTOM_TABS.Account.name,
          // title: Text(
          //   "User",
          //   style: TextStyle(
          //       fontSize: 30, color: _curIndex == 2 ? RED : APP_TEXT_COLOR),
          // ),
          activeIcon: Icon(
            Icons.assignment_ind,
            size: 30,
            color: APP_ACTIVE_COLOR,
          ),
        ),
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
        }
      },
    );
    ;
  }
}
// ignore: non_constant_identifier_names

