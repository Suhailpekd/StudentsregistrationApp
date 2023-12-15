import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_new/homestarting/home.dart';

class Reg1 extends StatefulWidget {
  const Reg1({super.key});

  @override
  State<Reg1> createState() => _Reg1State();
}

class _Reg1State extends State<Reg1> {
  bool a = false;

  var username = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var reentered_password = TextEditingController();
  var phonenumber = TextEditingController();
  final formkey = GlobalKey<FormState>();

  Future<void> function1() async {
    await FirebaseFirestore.instance.collection("user_reg").add({
      "username": username.text,
      "email": email.text,
      "password": password.text,
      "phone": phonenumber.text,
    }).then((value) => print("success"));

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home1(
              // docs11: [],
              // imageurl: '',
              ),
        ));
  }

  var passwordvisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
          body: SafeArea(
              child: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text("Kaylo",
                style: GoogleFonts.bagelFatOne(
                  fontSize: 64,
                  color: Colors.blue,
                )),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 50, bottom: 19),
            child: Text(
              "Students",
              style: GoogleFonts.bagelFatOne(
                  fontSize: 34, color: Color.fromARGB(255, 33, 33, 94)),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Container(
              height: 55,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  controller: username,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter your user name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Icon(Icons.people),
                      ),
                      hintText: "Username"),
                ),
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 225, 225),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Container(
              height: 55,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                        .hasMatch(value)) {
                      return 'Invalid email format';
                    }
                    return null;
                  },
                  controller: email,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Icon(Icons.email),
                      ),
                      hintText: "Email"),
                ),
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 225, 225),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Container(
              height: 55,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value!.length <= 7) {
                      return "password lenght must 8 charecter";
                    }
                    return null;
                  },
                  obscureText: !passwordvisible,
                  controller: password,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Icon(Icons.lock),
                      ),
                      hintText: "Password"),
                ),
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 225, 225),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
        ),
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        //     child: Container(
        //       height: 55,
        //       width: double.infinity,
        //       child: Center(
        //         child: TextFormField(
        //           validator: (value) {
        //             if (password != reentered_password) {
        //               return "passwords do not match";
        //             }
        //             // } else {
        //             //   if (password == reentered_password) {
        //             //     return "success";
        //             //   }
        //             // }
        //           },
        // controller: reentered_password,
        // decoration: InputDecoration(
        //     enabledBorder: InputBorder.none,
        //     disabledBorder: InputBorder.none,
        //     focusedBorder: InputBorder.none,
        //     icon: Padding(
        //       padding: const EdgeInsets.only(left: 13),
        //       child: Icon(Icons.lock),
        //     ),
        //     hintText: "Re Enter Password"),
        //   ),
        // ),
        //       decoration: BoxDecoration(
        //           color: const Color.fromARGB(255, 228, 225, 225),
        //           borderRadius: BorderRadius.circular(35)),
        //     ),
        //   ),
        // ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Container(
              height: 55,
              width: double.infinity,
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
                  controller: phonenumber,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Icon(Icons.mobile_friendly_sharp),
                      ),
                      hintText: "Phone Number"),
                ),
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 225, 225),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Checkbox(
        //         checkColor: Colors.white,
        //         value: a,
        //         onChanged: (value) => setState(() {
        //               a == value!;
        //             })),
        //     Text("accept the terms and conditions")
        //   ],
        // ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  function1();
                }
                ;
              },
              child: Container(
                width: 110,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(child: Text("Sign Up Now")),
              ),
            ),
          ]),
        ),
      ]))),
    );
  }
}
