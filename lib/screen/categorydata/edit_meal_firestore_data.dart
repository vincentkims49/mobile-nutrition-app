import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/consent/navigation.dart';

// ignore: must_be_immutable
class Getmeals extends StatefulWidget {
  Getmeals({
    super.key,
    required this.documentId,
  });

  final String documentId;

  @override
  State<Getmeals> createState() => _GetmealsState();
}

class _GetmealsState extends State<Getmeals> {
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

  TextEditingController _dinnerController1 = TextEditingController();
  TextEditingController _dinnerController2 = TextEditingController();

  String valueChooseLunch1 = 'Nothing to show';
  String valueChooseLunch2 = 'Nothing to show';
  String valueChooseDinner1 = 'Nothing to show';
  String valueChooseDinner2 = 'Nothing to show';
  String valueChooseBreakfast1 = 'Nothing to show';
  String valueChooseBreakfast2 = 'Nothing to show';

  List lunchItems = [
    'Pizza',
    'Steak',
    'Pasta',
    'Burger',
    'Nothing to show',
  ];
  List DinnerItems = [
    'Chips Burger',
    'Minced Meat',
    'Cheese pie Meat',
    'Grilled Meat',
    'Nothing to show',
  ];
  List breakfastItems = [
    'Pancake',
    'Egg Curry',
    'Banana Chips',
    'Rice Eggs',
    'Nothing to show',
  ];

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(widget.documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      breakfast(),
                      lunch(),
                      dinner(),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      final dinnerTotal = int.parse(_dinnerController1.text) +
                          int.parse(_dinnerController1.text);
                      dinnerTotal.toString();
                      print(dinnerTotal);

                      if (_dinnerController1.text.isEmpty ||
                          _dinnerController2.text.isEmpty) {
                        final docUser = FirebaseFirestore.instance
                            .collection("users")
                            .doc(widget.documentId);
                        docUser.update({
                          "lunch_1": valueChooseLunch1,
                          "lunch_2": valueChooseLunch2,
                          "breakfast_1": valueChooseBreakfast1,
                          "breakfast_2": valueChooseBreakfast2,
                          "dinner_1": valueChooseDinner1,
                          "dinner_2": valueChooseDinner2,
                          "dinnerController1": "0",
                        });

                        final snackBar = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            contentType: ContentType.success,
                            message: 'Any data changes will be UPDATED!',
                            title: 'Hello There!',
                          ),
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: ((context) => Navigation())));

                      } else {
                        final docUser = FirebaseFirestore.instance
                            .collection("users")
                            .doc(widget.documentId);
                        docUser.update({
                          "lunch_1": valueChooseLunch1,
                          "lunch_2": valueChooseLunch2,
                          "breakfast_1": valueChooseBreakfast1,
                          "breakfast_2": valueChooseBreakfast2,
                          "dinner_1": valueChooseDinner1,
                          "dinner_2": valueChooseDinner2,
                          "dinnerController1":
                              _dinnerController1.text.trim().toString(),
                        });

                        final snackBar = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            contentType: ContentType.success,
                            message: 'Any data changes will be UPDATED!',
                            title: 'Hello There!',
                          ),
                        );
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: ((context) => Navigation())));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: maincolor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ro',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          contentType: ContentType.success,
                          message: 'Any data changes will not be UPDATED!',
                          title: 'Oh Snap!',
                        ),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => Navigation())));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ro',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Text('');
        }
      }),
    );
  }

  Future picker() async {}

  lunch() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Lunch: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'First ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: DropdownButton(
            hint: Text("Select a meal"),
            items: lunchItems.map((valueItem) {
              return DropdownMenuItem(
                child: Text(valueItem),
                value: valueItem,
              );
            }).toList(),
            onChanged: ((newValue) {
              setState(() {
                valueChooseLunch1 = newValue.toString();
              });
            }),
            value: valueChooseLunch1,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Alternative ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: DropdownButton(
            hint: Text("Select a meal"),
            items: lunchItems.map((valueItem) {
              return DropdownMenuItem(
                child: Text(valueItem),
                value: valueItem,
              );
            }).toList(),
            onChanged: ((newValue) {
              setState(() {
                valueChooseLunch2 = newValue.toString();
              });
            }),
            value: valueChooseLunch2,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  breakfast() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Breakfast: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'First ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: DropdownButton(
            hint: Text("Select a meal"),
            items: breakfastItems.map((valueItem) {
              return DropdownMenuItem(
                child: Text(valueItem),
                value: valueItem,
              );
            }).toList(),
            onChanged: ((newValue) {
              setState(() {
                valueChooseBreakfast1 = newValue.toString();
              });
            }),
            value: valueChooseBreakfast1,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Alternative ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: DropdownButton(
            hint: Text("Select a meal"),
            items: breakfastItems.map((valueItem) {
              return DropdownMenuItem(
                child: Text(valueItem),
                value: valueItem,
              );
            }).toList(),
            onChanged: ((newValue) {
              setState(() {
                valueChooseBreakfast2 = newValue.toString();
              });
            }),
            value: valueChooseBreakfast2,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  dinner() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Dinner: ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'First ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Row(
            children: [
              DropdownButton(
                hint: Text("Select a meal"),
                items: DinnerItems.map((valueItem) {
                  return DropdownMenuItem(
                    child: Text(valueItem),
                    value: valueItem,
                  );
                }).toList(),
                onChanged: ((newValue) {
                  setState(() {
                    valueChooseDinner1 = newValue.toString();
                  });
                }),
                value: valueChooseDinner1,
              ),
            ],
          ),
        ),
        TextField(
          controller: _dinnerController1,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 300,
          decoration: InputDecoration(
            icon: Icon(Icons.food_bank_outlined),
            hintText: 'Amount to be taken in grams',
            hintStyle: TextStyle(fontFamily: 'ro'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Alternative ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Row(
            children: [
              DropdownButton(
                hint: Text("Select a meal"),
                items: DinnerItems.map((valueItem) {
                  return DropdownMenuItem(
                    child: Text(valueItem),
                    value: valueItem,
                  );
                }).toList(),
                onChanged: ((newValue) {
                  setState(() {
                    valueChooseDinner2 = newValue.toString();
                  });
                }),
                value: valueChooseDinner2,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        TextField(
          controller: _dinnerController2,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 300,
          decoration: InputDecoration(
            icon: Icon(Icons.food_bank_outlined),
            hintText: 'Amount to be taken in grams',
            hintStyle: TextStyle(fontFamily: 'ro'),
          ),
        )
      ],
    );
  }
}
