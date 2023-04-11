import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_flutter_app/pages/flipkart/authentication/SignUpPage.dart';
import 'package:my_flutter_app/pages/flipkart/authentication/forgotPassword.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/main.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';
import 'package:my_flutter_app/utils/flipkart/variables/tabVariables.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<Login> {
  TextEditingController emailAuth = TextEditingController();
  TextEditingController passwordAuth = TextEditingController();

  void loginOnClick() {
    if (emailAuth.text != '') {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
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
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MAIN_PADDING_HORIZONTAL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 350,
                  height: 120,
                  /*decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(50.0)),*/
                  child: Image.asset('assets/images/login.png')),
              TextField(
                controller: emailAuth,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'EnterYourEmail'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                    controller: passwordAuth,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Your Password')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InkWell(
                    child: const Text(
                      'ForgotPassword',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordPage()));
                    }),
              ),
              GestureDetector(
                onTap: () => loginOnClick(),
                child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                    child: const Text('Sign up',
                        style: TextStyle(color: Colors.blue, fontSize: 15)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
