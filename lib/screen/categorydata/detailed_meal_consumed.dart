import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:recipe/screen/categorydata/foodsavailable.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:intl/intl.dart';

class Detailed_meal_consumed extends StatefulWidget {
  const Detailed_meal_consumed({super.key});

  @override
  State<Detailed_meal_consumed> createState() => _Detailed_meal_consumedState();
}

class _Detailed_meal_consumedState extends State<Detailed_meal_consumed> {
  // List<MealConsumed> mealsConsumed = [];

  // @override
  // void didChangeDependencies() {
  //   provideMealsConsumed();
  //   super.didChangeDependencies();
  // }

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
      appBar: AppBar(
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(right: 15, left: 15),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Today,',
                style: TextStyle(
                    color: Color.fromARGB(255, 75, 73, 73),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                formattedDate,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListView.builder(
            //     itemCount: mealsConsumed.length,
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     padding: EdgeInsets.only(bottom: 15),
            //     itemBuilder: (BuildContext context, int index) {
            //       return mealConsumedTile(mealsConsumed[index]);
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 5),
              child: Container(
                height: 720,
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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 60,
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Remaining',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '1,112',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'kcal',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          LinearPercentIndicator(
                            width: 250,
                            animation: true,
                            lineHeight: 6,
                            animationDuration: 2500,
                            percent: 0.8,
                            barRadius: Radius.circular(3),
                            progressColor: Colors.blue,
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.blue.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: maincolor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 27,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void provideMealsConsumed() {
  //   mealsConsumed.add(MealConsumed(
  //       mealAmount: '407',
  //       mealName: 'Breakfast',
  //       progressValue: 50,
  //       consumedFoods: [
  //         FoodConsumed(
  //           foodName: "",
  //           consumedAmount: '30 ml',
  //           boxColor: Colors.blue,
  //         ),
  //         FoodConsumed(
  //           foodName: 'Croissant',
  //           consumedAmount: '100 ml',
  //           boxColor: Colors.blue,
  //         )
  //       ]));

  //   mealsConsumed.add(MealConsumed(
  //       mealAmount: '352',
  //       mealName: 'Lunch',
  //       progressValue: 70,
  //       consumedFoods: [
  //         FoodConsumed(
  //           foodName: 'Chicken breast',
  //           consumedAmount: '200 g',
  //           boxColor: Colors.orange,
  //         ),
  //         FoodConsumed(
  //           foodName: 'Green salad',
  //           consumedAmount: '100 g',
  //           boxColor: Colors.orange,
  //         )
  //       ]));

  //   mealsConsumed.add(MealConsumed(
  //       mealAmount: '635',
  //       mealName: 'Dinner',
  //       progressValue: 30,
  //       consumedFoods: [
  //         FoodConsumed(
  //           foodName: 'Pasta with tomato sauce',
  //           consumedAmount: '160 g',
  //           boxColor: Colors.green,
  //         ),
  //       ]));
  // }
}
