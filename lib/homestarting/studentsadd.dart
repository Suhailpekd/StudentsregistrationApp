import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app_new/homestarting/home.dart';

class Studentsadd extends StatefulWidget {
  const Studentsadd({super.key});

  @override
  State<Studentsadd> createState() => _StudentsaddState();
}

class _StudentsaddState extends State<Studentsadd> {
  var name1 = "";
  var age = "";
  var dateofbirth = "";
  var joiningdate = "";
  File? image;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;

      setState(() {
        image = File(pickedImage.path);
      });
    } catch (e) {
      print('Error picking image');
    }
  }

  Future<void> _uploadCase() async {
    print('Uploading case...');

    //Upload image to Firebase Storage
    if (image != null) {
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('case_images/$imageName');
      await storageReference.putFile(image!);

      // Get the download URL
      String imageUrl = await storageReference.getDownloadURL();
      print('Image uploaded. URL: $imageUrl');

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home1(
                // docs11: [], //imageurl: imageUrl
                )),
      );
    } else {
      print('No image selected.');
    }
  }

  Future<void> function1() async {
    await FirebaseFirestore.instance.collection("students").add({
      "username": name1,
      "email": age,
      "password": dateofbirth,
      "phone": joiningdate,
    }).then((value) => print("success"));

    // await FirebaseFirestore.instance
    //     .collection("students")
    //     .get()
    //     .then((snapshot) {
    //   List<QueryDocumentSnapshot> docList = snapshot.docs;

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home1()
            // docs11: docList,
            //imageurl: '',

            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                "Enter Students Details !",
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 105, 192),
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _pickImage(ImageSource.camera);
                          },
                          child: Text("camera")),
                      ElevatedButton(
                          onPressed: () {
                            _pickImage(ImageSource.gallery);
                          },
                          child: Text("gallery")),
                    ],
                  );
                },
              );
            },
            child: CircleAvatar(
              child: Image.asset(
                  "asset/Screenshot_2023-12-08_141610-removebg-preview.png"),
              radius: 70,
              backgroundColor: Colors.blue,
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Add Photo "),
          )),
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) => name1 = value,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Icon(Icons.people),
                            ),
                            hintText: "Enter Your Name"),
                      ),
                    ),
                  ))),
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) => age = value,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Icon(Icons.people),
                            ),
                            hintText: "Enter Your Age"),
                      ),
                    ),
                  ))),
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) => dateofbirth = value,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Icon(Icons.people),
                            ),
                            hintText: "Enter Your Date of birth"),
                      ),
                    ),
                  ))),
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) => joiningdate = value,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Icon(Icons.people),
                            ),
                            hintText: "Enter Your Joining date"),
                      ),
                    ),
                  ))),
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: ElevatedButton(
                onPressed: () {
                  function1();
                  _uploadCase();
                },
                child: Text("Save Your Details")),
          )
        ],
      ),
    );
  }
}
