import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/style/flipkart/colors.dart';
// import 'package:flutter_project/CreateNewPasswordPage.dart';
// import 'package:flutter_sms/flutter_sms.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  bool isOtpSent = false;
  TextEditingController _controller = new TextEditingController();
  Future<void> _sendSMS(String recipient) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: recipient,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  String _generateOTP() {
    return (Random().nextInt(999999) + 100000).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: APP_BAR_BG,
        title: const Text("Reset Password Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/flutter-logo.png')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number',
                    hintText: 'Enter your phone number'),
              ),
            ),
            if (isOtpSent)
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter OTP',
                      hintText: 'Enter OTP'),
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
                  child: TextButton(
                    onPressed: () {
                      if (!isOtpSent) {
                        _sendSMS(_controller.text);
                        setState(() {
                          isOtpSent = true;
                        });
                      } else {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (_) => const CreateNewPasswordPage()));
                        // }
                        Navigator.pop(context, true);
                      }
                    },
                    child: Text(
                      isOtpSent ? 'Verify OTP' : 'Send OTP',
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                )),
            if (isOtpSent)
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: InkWell(
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
