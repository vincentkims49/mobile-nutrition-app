import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:recipe/screen/categorydata/foodsavailable.dart';
import 'package:recipe/screen/categorydata/statsdata.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/screens/sidebar.dart';
import 'package:intl/intl.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
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
    var now = DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    return Scaffold(
      backgroundColor: background,
      drawer: Navbar(),
      appBar: AppBar(
        title: Center(child: Text("Eat Healthy")),
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Today,',
                style: TextStyle(
                    color: Color.fromARGB(255, 75, 73, 73),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7),
              Text(
                formattedDate,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 380,
                child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            tileColor: background,
                            title: statsdata(
                              documentId: docIDs[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 5),
                child: Container(
                  height: 230,
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
                              tileColor: background,
                              title: Getfood(
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
            ],
          ),
        ),
      ),
    );
  }
}
