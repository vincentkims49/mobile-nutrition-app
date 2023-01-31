import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recipe/screen/categorydata/detailed_meal_consumed.dart';

import 'package:recipe/screen/consent/colors.dart';

class statsdata extends StatelessWidget {
  const statsdata({
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
            int totakcal = data['dinnertotal'] +
                data['breakfasttotal'] +
                data['lunchtotal'];
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: maincolor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Stats',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Average nutrients present in the selected meals:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 60,
                                    child: Row(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: -1,
                                          child: LinearPercentIndicator(
                                            width: 60,
                                            animation: true,
                                            lineHeight: 6,
                                            animationDuration: 2500,
                                            percent: 0.8,
                                            barRadius: Radius.circular(3),
                                            progressColor: Colors.green,
                                            padding: EdgeInsets.zero,
                                            backgroundColor:
                                                Colors.blue.withOpacity(0.4),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Fats",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '250 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'kCal',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    height: 60,
                                    child: Row(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: -1,
                                          child: LinearPercentIndicator(
                                            width: 60,
                                            animation: true,
                                            lineHeight: 6,
                                            animationDuration: 2500,
                                            percent: 0.8,
                                            barRadius: Radius.circular(3),
                                            progressColor: Colors.green,
                                            padding: EdgeInsets.zero,
                                            backgroundColor:
                                                Colors.blue.withOpacity(0.4),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Proteins",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '250 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'kCal',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                child: Row(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: -1,
                                      child: LinearPercentIndicator(
                                        width: 60,
                                        animation: true,
                                        lineHeight: 6,
                                        animationDuration: 2500,
                                        percent: 0.8,
                                        barRadius: Radius.circular(3),
                                        progressColor: Colors.green,
                                        padding: EdgeInsets.zero,
                                        backgroundColor:
                                            Colors.blue.withOpacity(0.4),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Carbs",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '250 ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'kCal',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Total calories in kilos present in the meals:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Remaining",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              width: 100,
                                            ),
                                            Text(
                                              totakcal.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              " kcal",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RotatedBox(
                                          quarterTurns: 0,
                                          child: LinearPercentIndicator(
                                            width: 200,
                                            animation: true,
                                            lineHeight: 6,
                                            animationDuration: 2500,
                                            percent: totakcal.toDouble() / 5994,
                                            barRadius: Radius.circular(3),
                                            progressColor: Colors.red,
                                            padding: EdgeInsets.zero,
                                            backgroundColor:
                                                Colors.blue.withOpacity(0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
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
                          'View',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          ' all',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          ' /',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          ' select ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          ' meals for  the day',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        } else {
          return Text('');
        }
      }),
    );
  }
}
