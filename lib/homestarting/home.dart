import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app_new/homestarting/studentsadd.dart';
import 'package:todo_app_new/screens/reg_and_log/login.dart';

class Home1 extends StatefulWidget {
  // Remove unnecessary parameter
  //var docs11;
  Home1({
    Key? key, // required this.docs11
  }) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  // RangeValues _currentRangeValues = const RangeValues(0, 10);

  Future<List<QueryDocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("students").get();
      return querySnapshot.docs;
    } catch (e) {
      // Handle errors, log or display a meaningful error message.
      print("Error fetching data: $e");
      return [];
    }
  }

  RangeValues _currentRangeValues = const RangeValues(0, 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... (unchanged code)

      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // ... (unchanged code)

              // Display the data from Firestore
              return ListView(
                children: [
                  Container(
                    height: 54,
                    color: Color.fromARGB(255, 9, 99, 189),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        icon: Icon(Icons.search),
                                        hintText: "Search"),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 243, 243, 243),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Tooltip(
                              message: "Logout",
                              child: InkWell(
                                onTap: () async {
                                  await GoogleSignIn().signOut();
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyWidget()));
                                },
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("SELECT THE RANGE 0-50"),
                  ),
                  RangeSlider(
                    values: _currentRangeValues,
                    max: 50,
                    divisions: 5,
                    labels: RangeLabels(
                      _currentRangeValues.start.round().toString(),
                      _currentRangeValues.end.round().toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                      });
                    },
                  ),
                  for (var doc in snapshot.data as List<QueryDocumentSnapshot>)
                    Center(
                      child: ListTile(
                        title: Row(
                          children: [
                            Text("Name "),
                            Text(doc['username']),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text("Age"),
                            Text(doc["email"]),
                          ],
                        ),
                      ),
                    )

                  //     child: ListView.builder(
                  //       shrinkWrap: true,
                  //       physics: NeverScrollableScrollPhysics(),
                  //       itemCount: widget.docs11.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return
                  //       },
                  //     ),
                  //   ),
                  // ]),
                  ,
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return Studentsadd();
                                  },
                                ));
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            } else {
              return Center(child: Text("No data available"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'package:todo_app_new/screens/reg_and_log/login.dart';

// class Home1 extends StatefulWidget {
//   //final List<QueryDocumentSnapshot> docs11;
//   // final imageurl;
//   Home1({
//     super.key, required List docs11,
//     // yy
//     //required this.imageurl
//   });

//   @override
//   State<Home1> createState() => _Home1State();
// }

// class _Home1State extends State<Home1> {
//   RangeValues _currentRangeValues = const RangeValues(0, 10);

//   // var a = ["no data available"];
//   // var db = FirebaseFirestore.instance;
//   // var docRef = db.collection('your_collection').doc('your_document');

//   Future<dynamic> fire1() async {
//     await FirebaseFirestore.instance
//         .collection("students")
//         .get()
//         .then((snapshot) {
//       List<QueryDocumentSnapshot> docList112 = snapshot.docs;

//       // Navigator.push(
//       //     context,
//       //     MaterialPageRoute(
//       //         builder: (context) => Home1(
//       //               docs11: docList,
//       //               //imageurl: '',
//       //
//       //          )));
//       return docList112;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color.fromARGB(255, 231, 240, 235),
//         body: FutureBuilder(
//             future: fire1(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Stack(children: [
//                   ListView(
//                     children: [
//                       
//                 ]);
//               } else {
//                 return Center(child: Text("error"));
//               }
//             }));
//   }
// }
