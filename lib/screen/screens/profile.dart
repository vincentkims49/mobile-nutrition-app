import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';

import 'package:recipe/screen/profile/readcontents/read_image.dart';

// ignore: must_be_immutable
class Profil extends StatelessWidget {
  Profil({super.key});
  final user = FirebaseAuth.instance.currentUser;
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(
            children: [
              Container(
                height: 700,
                child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:  EdgeInsets.all(0),
                          child: ListTile(
                            tileColor: background,
                            title: GetImage(
                              documentId: docIDs[0],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
