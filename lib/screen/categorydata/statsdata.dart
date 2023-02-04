import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recipe/screen/categorydata/detailed_meal_consumed.dart';
import 'package:recipe/screen/categorydata/edit_meals.dart';

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
              height: 15,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => EditMeals())));
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
            double carbsTotal = totakcal / 7 * 16.7;
            double fatsTotal = totakcal / 7 * 29.3;
            double allTotal = fatsTotal + carbsTotal * 2;
            double lunchTotal = data['lunchtotal'] / 7 * 29.3 +
                data['lunchtotal'] / 7 * 16.7 * 2;
            double dinnerTotal = data['dinnertotal'] / 12 * 29.3 +
                data['dinnertotal'] / 7 * 16.7 * 2;
            double breakfastTotal = data['breakfasttotal'] / 7 * 29.3 +
                data['breakfasttotal'] / 7 * 16.7 * 2;

            var nowTime = DateTime.now();

            return Container(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (nowTime.hour > 12 && nowTime.hour < 19)
                          Text(
                            'GoodAfternoon,',
                            style: TextStyle(
                                color: Color.fromARGB(255, 75, 73, 73),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        if (nowTime.hour > 18 && nowTime.hour < 25)
                          Text(
                            'GoodEvening,',
                            style: TextStyle(
                                color: Color.fromARGB(255, 75, 73, 73),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        if (nowTime.hour >= 0 && nowTime.hour < 13)
                          Text(
                            'GoodMorning,',
                            style: TextStyle(
                                color: Color.fromARGB(255, 75, 73, 73),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          data['first name'].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          'Today Report',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IntakeContainer(
                              nowTime: nowTime,
                              lunchTotal: lunchTotal,
                              dinnerTotal: dinnerTotal,
                              breakfastTotal: breakfastTotal,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            BurnContainer(
                                nowTime: nowTime,
                                lunchTotal: lunchTotal,
                                dinnerTotal: dinnerTotal,
                                breakfastTotal: breakfastTotal),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StatsContainer(
                        fatsTotal: fatsTotal,
                        carbsTotal: carbsTotal,
                        allTotal: allTotal),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) =>
                                  Detailed_meal_consumed())));
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
                ),
              ),
            );
          }
        } else {
          return Text('');
        }
      }),
    );
  }
}

class StatsContainer extends StatelessWidget {
  const StatsContainer({
    super.key,
    required this.fatsTotal,
    required this.carbsTotal,
    required this.allTotal,
  });

  final double fatsTotal;
  final double carbsTotal;
  final double allTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background.withOpacity(.1),
        border: Border.all(style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.withOpacity(.1),
                        ),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: -1,
                                child: LinearPercentIndicator(
                                  width: 60,
                                  animation: true,
                                  lineHeight: 6,
                                  animationDuration: 2500,
                                  percent: fatsTotal / 12414.6,
                                  barRadius: Radius.circular(3),
                                  progressColor: Colors.green,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.blue.withOpacity(0.4),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    fatsTotal.toStringAsFixed(2),
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
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red.withOpacity(.1),
                        ),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: -1,
                                child: LinearPercentIndicator(
                                  width: 60,
                                  animation: true,
                                  lineHeight: 6,
                                  animationDuration: 2500,
                                  percent: carbsTotal / 12414.6,
                                  barRadius: Radius.circular(3),
                                  progressColor: Colors.green,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.blue.withOpacity(0.4),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    carbsTotal.toStringAsFixed(2),
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.withOpacity(.1),
                        ),
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: -1,
                                child: LinearPercentIndicator(
                                  width: 60,
                                  animation: true,
                                  lineHeight: 6,
                                  animationDuration: 2500,
                                  percent: carbsTotal / 12414.6,
                                  barRadius: Radius.circular(3),
                                  progressColor: Colors.green,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.blue.withOpacity(0.4),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    carbsTotal.toStringAsFixed(2),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "kCal",
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Total calories in kilos present in the todays meals:',
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
                                  "Total",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  allTotal.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  " /",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  " 2700",
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
                            if (allTotal > 2700)
                              InkWell(
                                onTap: () {
                                  final snackBar = SnackBar(
                                    elevation: 0,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      contentType: ContentType.success,
                                      message:
                                          'Recommended daily calorie intakes is around 2,700 for men and 2,000 for women!',
                                      title: 'Attention!',
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(snackBar);
                                },
                                child: RotatedBox(
                                  quarterTurns: 0,
                                  child: LinearPercentIndicator(
                                    width: 200,
                                    animation: true,
                                    lineHeight: 10,
                                    animationDuration: 2500,
                                    percent: allTotal.toDouble() / 12414.6,
                                    barRadius: Radius.circular(3),
                                    progressColor: Colors.red,
                                    padding: EdgeInsets.zero,
                                    backgroundColor:
                                        Colors.blue.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            if (allTotal < 2700)
                              RotatedBox(
                                quarterTurns: 0,
                                child: LinearPercentIndicator(
                                  width: 200,
                                  animation: true,
                                  lineHeight: 6,
                                  animationDuration: 2500,
                                  percent: allTotal.toDouble() / 12414.6,
                                  barRadius: Radius.circular(3),
                                  progressColor: Colors.blue,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.blue.withOpacity(0.4),
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
    );
  }
}

class BurnContainer extends StatelessWidget {
  const BurnContainer({
    super.key,
    required this.nowTime,
    required this.lunchTotal,
    required this.dinnerTotal,
    required this.breakfastTotal,
  });

  final DateTime nowTime;
  final double lunchTotal;
  final double dinnerTotal;
  final double breakfastTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
        border: Border.all(style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Burned',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Icon(
                      FontAwesomeIcons.fire,
                      color: Colors.red,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Meal taken at: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    width: 3,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      value: 1,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (nowTime.hour > 18 && nowTime.hour < 25)
                        Column(
                          children: [
                            Text(
                              "Lunch time",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total calories',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              lunchTotal.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      if (nowTime.hour >= 0 && nowTime.hour < 13)
                        Column(
                          children: [
                            Text(
                              "Supper time",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total calories',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              dinnerTotal.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      if (nowTime.hour > 12 && nowTime.hour < 19)
                        Column(
                          children: [
                            Text(
                              "Breakfast time",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total calories',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              breakfastTotal.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      Text(
                        'kCal',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IntakeContainer extends StatelessWidget {
  const IntakeContainer({
    super.key,
    required this.nowTime,
    required this.lunchTotal,
    required this.dinnerTotal,
    required this.breakfastTotal,
  });

  final DateTime nowTime;
  final double lunchTotal;
  final double dinnerTotal;
  final double breakfastTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
        border: Border.all(style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Intake',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Icon(
                      FontAwesomeIcons.pizzaSlice,
                      color: Colors.orange,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Meal taken at: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 80,
                    width: 3,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      value: 1,
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      if (nowTime.hour > 12 && nowTime.hour < 19)
                        Column(
                          children: [
                            Text(
                              "Lunch time",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total calories',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              lunchTotal.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      if (nowTime.hour > 18 && nowTime.hour < 25)
                        Column(
                          children: [
                            Text(
                              "Supper time",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total calories',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              dinnerTotal.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      if (nowTime.hour >= 0 && nowTime.hour < 13)
                        Column(
                          children: [
                            Text(
                              "Breakfast time",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Total calories',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              breakfastTotal.toStringAsFixed(2),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      Text(
                        'kCal',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
