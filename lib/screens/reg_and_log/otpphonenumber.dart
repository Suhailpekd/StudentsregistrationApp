import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_new/screens/reg_and_log/otp1.dart';

class Authentication2 extends StatefulWidget {
  Authentication2({super.key});
  static String verify = "";
  @override
  State<Authentication2> createState() => _Authentication2State();
}

class _Authentication2State extends State<Authentication2> {
  var phone = "";
  final formkey = GlobalKey<FormState>();

  Future<void> otp1() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Authentication2.verify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => Input1()));
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 251, 251),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    width: screenwidth,
                    height: 56,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 4),
                        color: Colors.white),
                    child: Center(
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Invalid phone number format';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            phone = value;
                          },
                          decoration:
                              InputDecoration(border: InputBorder.none)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            otp1();
                          }

                          // await FirebaseAuth.instance.verifyPhoneNumber(
                          //   phoneNumber: '+91$phone',
                          //   verificationCompleted:
                          //       (PhoneAuthCredential credential) {},
                          //   verificationFailed: (FirebaseAuthException e) {},
                          //   codeSent:
                          //       (String verificationId, int? resendToken) {
                          //     Authentication2.verify = verificationId;
                          //   },
                          //   codeAutoRetrievalTimeout:
                          //       (String verificationId) {},
                          // );

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Input1()));
                        },
                        icon: Icon(Icons.message),
                        label: Text("Sent Otp")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
