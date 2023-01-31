import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screen/categorydata/detailed_meal_consumed.dart';
import 'package:recipe/screen/consent/colors.dart';

class ValueIntaked extends StatelessWidget {
  const ValueIntaked({
    Key? key,
    required this.documentId,
  }) : super(key: key);
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
         

          if (data['dinnertotal'] == null) {
            return Container(
              height: 10,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Detailed_meal_consumed())));
                      },
                      child: Row(
                        children: [
                          Text(
                            'Please click',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' here ',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'to Start',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              color: maincolor,
            );
          }
        } else {
          return Text("");
        }
      }),
    );
  }
}
