import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app_new/homestarting/home.dart';
import 'package:todo_app_new/screens/reg_and_log/otpphonenumber.dart';

import 'package:todo_app_new/screens/reg_and_log/regpage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var a;
  Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    a = userCredential.user?.displayName;
    var b = userCredential.user?.email;
    print(b);
    print(a);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home1(
              // docs11: [],
              //imageurl: null,
              ),
        ));
  }

  Future<dynamic> function3() async {
    await FirebaseFirestore.instance.collection("user_reg").get().then(
      (snapshot) {
        List<QueryDocumentSnapshot> docList = snapshot.docs;
        print(docList);
        return docList;
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => View1(docs11: docList)));
      },
    );
  }

  var passwordvisible = false;
  var user = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: Text(
              "Kaylo",
              style: GoogleFonts.bagelFatOne(
                fontSize: 64,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 60, bottom: 30),
            child: Text(
              "Students",
              style: GoogleFonts.bagelFatOne(
                  fontSize: 34, color: Color.fromARGB(255, 33, 33, 94)),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Container(
              height: 65,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  onChanged: (value) => user = value,
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
            padding: const EdgeInsets.all(25),
            child: Container(
              height: 65,
              width: double.infinity,
              child: Center(
                child: TextFormField(
                  onChanged: (value) => password = value,
                  obscureText: !passwordvisible,
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
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Center(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reg1(),
                        )),
                    child: Container(
                      width: 110,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(child: Text("Sign Up")),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(child: Text("Login")),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 28, top: 28),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Or Sign in with"),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 34),
                  child: InkWell(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: .1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 247, 246, 246),
                      ),
                      child: Image.asset(
                        cacheHeight: 30,
                        cacheWidth: 30,
                        "asset/Google__G__Logo2.png",
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    function3();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Authentication2(),
                        ));
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      border: Border.all(width: .1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 247, 246, 246),
                    ),
                    child: Image.asset(
                      cacheHeight: 30,
                      cacheWidth: 30,
                      "asset/3954528.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 45,
        )
      ]),
    );
  }
}
