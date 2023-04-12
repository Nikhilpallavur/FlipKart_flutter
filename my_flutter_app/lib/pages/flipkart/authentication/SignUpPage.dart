import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/main.dart';
import 'package:my_flutter_app/style/flipkart/colors.dart';
import 'package:my_flutter_app/utils/flipkart/variables/tabVariables.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailAuth = TextEditingController();
  TextEditingController passwordAuth = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: APP_BAR_BG,
        title: const Text("Signup Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 350,
                    height: 120,
                    /*decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/login.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailAuth,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordAuth,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password'),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Re-enter your password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailAuth.text, password: passwordAuth.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePageMain(
                                    selectedButtonProps: FLIPKART,
                                    selectedTabProps: BOTTOM_TABS.Home.name,
                                  )));
                    }).catchError((error) {
                      print(error);
                    });
                  },
                  child: const Center(
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
