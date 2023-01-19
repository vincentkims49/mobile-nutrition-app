import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/profile/contactus.dart';
import 'package:recipe/screen/profile/edit_profila_page.dart';
import 'package:recipe/screen/profile/faqs.dart';
import 'package:recipe/screen/profile/personaldata.dart';

// ignore: must_be_immutable
class GetImage extends StatelessWidget {
  GetImage({
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

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Column(
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 90),
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/backj.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(120),
                          bottomRight: Radius.circular(120),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 160,
                      child: Stack(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 90,
                                backgroundColor: background,
                                child: Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: maincolor,
                                      width: 2,
                                    ),
                                    color: Colors.grey,
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.3),
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage('${data['imageurl']}'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => EditProfil())));
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: maincolor, width: 2),
                                  color: background,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Center(child: Text("Signed in as:")),
              Center(
                child: Text(
                  '${data['email']}',
                  style: TextStyle(fontSize: 18, color: font, fontFamily: 'ro'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 40,
                  thickness: 2,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Personal data",
                    style: TextStyle(fontSize: 17, color: font),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => pPersonaldata())));
                },
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                ),
              ),
              ListTile(
                leading: Icon(Icons.chat),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "FAQs",
                    style: TextStyle(fontSize: 17, color: font),
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) => Faqs())));
                },
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                ),
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Contact us",
                    style: TextStyle(fontSize: 17, color: font),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Contactus())));
                },
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 15,
                ),
              ),
              Divider(),
              SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                      color: maincolor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ro',
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text('');
        }
      }),
    );
  }
}
