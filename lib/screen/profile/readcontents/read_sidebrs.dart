import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/consent/navigation.dart';

import 'package:recipe/screen/profile/personaldata.dart';
import 'package:recipe/screen/tolearn/pages/home_page.dart';

// ignore: must_be_immutable
class Getbars extends StatelessWidget {
  Getbars({
    super.key,
    required this.documentId,
  });

  final String documentId;

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
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Signed in as '),
                  accountEmail: Text('${data['email']}'),
                  currentAccountPicture: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => pPersonaldata())));
                    },
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          image: NetworkImage('${data['imageurl']}'),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: maincolor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(height: 15),
                ListTile(
                  leading: Icon(Icons.line_style_rounded),
                  title: Text("My list"),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => ToLearn())));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share),
                  title: Text("Share"),
                  onTap: () => null,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app_rounded),
                  title: Text("Back"),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Navigation())));
                  },
                ),
              ],
            ),
          );
        } else {
          return Text('Loading...');
        }
      }),
    );
  }
}
