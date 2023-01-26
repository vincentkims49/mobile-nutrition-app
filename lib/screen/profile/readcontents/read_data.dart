import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';

class GetUserName extends StatelessWidget {
  GetUserName({super.key, required this.documentId});
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'First Name: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: font,
                          fontFamily: 'R',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ${data['first name']}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Last Name: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: font,
                          fontFamily: 'R',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ${data['last name']}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Email: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: font,
                          fontFamily: 'R',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ${data['email']}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Uid: ',
                        style: TextStyle(
                          fontSize: 18,
                          color: font,
                          fontFamily: 'R',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ${data['uid']}',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
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
