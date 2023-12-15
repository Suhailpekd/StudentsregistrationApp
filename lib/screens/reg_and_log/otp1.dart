import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:todo_app_new/homestarting/home.dart';
import 'package:todo_app_new/screens/reg_and_log/otpphonenumber.dart';

class Input1 extends StatefulWidget {
  const Input1({super.key});

  @override
  State<Input1> createState() => _Input1State();
}

class _Input1State extends State<Input1> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var otp = "";
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Pinput(
              length: 6,
              showCursor: true,
              animationCurve: Curves.decelerate,
              onChanged: (value) {
                otp = value;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: ElevatedButton(
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: Authentication2.verify, smsCode: otp);

                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home1(
                          // docs11: [],
                          //imageurl: '',
                          ),
                    ));
              },
              child: Text("verify otp")),
        )
      ],
    ));
  }
}
