import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/profile/edit_profila_page.dart';
import 'package:recipe/screen/profile/readcontents/read_data.dart';

class pPersonaldata extends StatefulWidget {
  pPersonaldata({super.key});

  @override
  State<pPersonaldata> createState() => _pPersonaldataState();
}

class _pPersonaldataState extends State<pPersonaldata> {
  List<String> docIDs = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Personal Data")),
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      backgroundColor: background,
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Profile Data",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Below is your personal data. The uid is your account identifier.",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 222, 240, 213),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 300,
                child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.5),
                          child: ListTile(
                            tileColor: Colors.grey[200],
                            title: GetUserName(
                              documentId: docIDs[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => EditProfil())));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: maincolor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    'Edit Data',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'ro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
