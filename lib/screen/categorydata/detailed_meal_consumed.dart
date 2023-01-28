import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
              padding: EdgeInsets.only(right: 0, left: 0),
              child: Container(
                height: 760,
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
