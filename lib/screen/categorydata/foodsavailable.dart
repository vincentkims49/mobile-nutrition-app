import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Getfood extends StatelessWidget {
  Getfood({super.key, required this.documentId});
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

          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                value: 50 / 100,
                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              ' Breakfast',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "400",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 1),
                            Text(
                              'kcal',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.zero,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  VerticalDivider(
                                    color: Colors.blue,
                                    thickness: 2,
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' ${data['breakfast_1']}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "21 g",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            margin: EdgeInsets.zero,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  VerticalDivider(
                                    color: Colors.blue,
                                    thickness: 2,
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' ${data['breakfast_2']}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "21 g",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                value: 50 / 100,
                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              ' Lunch',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "400",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 1),
                            Text(
                              'kcal',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.zero,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  VerticalDivider(
                                    color: Colors.blue,
                                    thickness: 2,
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' ${data['lunch_1']}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "21 g",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            margin: EdgeInsets.zero,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  VerticalDivider(
                                    color: Colors.blue,
                                    thickness: 2,
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' ${data['lunch_2']}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "21 g",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                value: 50 / 100,
                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              ' Dinner',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "400",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 1),
                            Text(
                              'kcal',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            height: 70,
                            margin: EdgeInsets.zero,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  VerticalDivider(
                                    color: Colors.blue,
                                    thickness: 2,
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' ${data['dinner_1']}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "21 g",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            margin: EdgeInsets.zero,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  VerticalDivider(
                                    color: Colors.blue,
                                    thickness: 2,
                                  ),
                                  SizedBox(width: 15),
                                  Container(
                                    height: 54,
                                    width: 54,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' ${data['dinner_2']}',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "21 g",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else {
          return Text('');
        }
      }),
    );
  }
}
