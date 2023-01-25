import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';

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

String? documentId;

newI() {
  CollectionReference user = FirebaseFirestore.instance.collection('users');

  return FutureBuilder<DocumentSnapshot>(
    future: user.doc(documentId).get(),
    builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;

        return CircleAvatar(
          backgroundImage: NetworkImage('${data['imageurl']}',),
          
        );
      } else {
        return Text('');
      }
    }),
  );
}

PreferredSizeWidget appbaar() {
  return AppBar(
    title: Center(child: Text("Your Cooking Tasks")),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: InkWell(onTap: () {}, child: newI()),
      ),
    ],
    backgroundColor: maincolor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
  );
}
