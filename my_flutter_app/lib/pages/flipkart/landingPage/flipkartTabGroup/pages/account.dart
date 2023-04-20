// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/pages/flipkart/authentication/login.dart';
import 'package:my_flutter_app/pages/flipkart/product/myOrders/myOrders.dart';
import 'package:my_flutter_app/pages/flipkart/product/wishList/wishList.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';
import 'package:my_flutter_app/utils/flipkart/variables/tabVariables.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final List<dynamic> listButtons = [
    {
      'name': 'Account settings',
      'icon': Icons.settings,
      'id': ACCOUNT_SETTINGS
    },
    {'name': 'My Orders', 'icon': Icons.shop, 'id': MY_ORDERS},
    {'name': 'Wish list', 'icon': Icons.favorite, 'id': WISH_LIST}
  ];

  final List<dynamic> secondButtons = [
    {
      'name': 'Notification settings',
      'icon': Icons.notifications,
      'id': NOTIFICATION_SETTINGS
    },
    {'name': 'Saved address', 'icon': Icons.pin_drop, 'id': SAVED_ADDRESS},
  ];

  final List<dynamic> accountButtons = [
    {
      'name': 'Flipkart plus',
      'icon': Icons.enhanced_encryption,
      'id': FLIPKART_PLUS
    },
    {'name': 'Saved cards', 'icon': Icons.credit_card, 'id': SAVED_CARDS},
    {'name': 'Wallet', 'icon': Icons.wallet, 'id': WALLET},
  ];

  final List<dynamic> logoutButton = [
    {'name': 'Logout', 'icon': Icons.logout, 'id': LOGOUT},
  ];

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  void navigateTo(String id) {
    if (id == WISH_LIST) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const WishList()));
      return;
    }
    if (id == MY_ORDERS) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OrderList()));
      return;
    }
    if (id == LOGOUT) {
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: MAIN_PADDING_HORIZONTAL),
        child: Column(children: [
          const SizedBox(height: 20),
          const SizedBox(
              width: 350,
              height: 120,
              child: Icon(
                Icons.account_circle,
                size: 120,
                color: Colors.blue,
              )),
          const Text('Nikhil K',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          const Text('+91 6238240877'),
          const Text('Fibonalabs, Bangalore'),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5.6,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                //set border radius more than 50% of height and width to make circle
              ),
              child: ListButtonCard(listButtons),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5.6,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                //set border radius more than 50% of height and width to make circle
              ),
              child: ListButtonCard(accountButtons),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                //set border radius more than 50% of height and width to make circle
              ),
              child: ListButtonCard(secondButtons),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                //set border radius more than 50% of height and width to make circle
              ),
              child: ListButtonCard(logoutButton),
            ),
          )
        ]));
  }

  Widget ListButtonCard(list) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () => navigateTo(list[index]['id']),
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        list[index]['icon'],
                        size: 20,
                        color: Colors.black54,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(list[index]['name']),
                      )
                    ]),
              ));
        });
  }
}
