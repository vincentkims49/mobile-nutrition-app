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
  TextEditingController _lunchController1 = TextEditingController();
  TextEditingController _lunchController2 = TextEditingController();
  TextEditingController _breakfastController1 = TextEditingController();
  TextEditingController _breakfastController2 = TextEditingController();

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
  void dispose() {
    _dinnerController1.dispose();
    _dinnerController2.dispose();
    _lunchController1.dispose();
    _lunchController2.dispose();
    _breakfastController1.dispose();
    _breakfastController2.dispose();

    super.dispose();
  }

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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          dinnerfunction();
                          breakfastfunction();
                          lunchfunction();

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
                          });

                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              contentType: ContentType.success,
                                                    color: Colors.red,

                              // 'Total calories= ${totakcal} kcal\nRecommended daily calorie intake is 2,000 calories a day for women and 2,500 for men!. Please Update the amounts for healthy purpose.',

                              message: 'Any data changes will be UPDATED!',
                              title: 'Hello There!',
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Navigation())));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 100,
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
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          final snackBar = SnackBar(
                            
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              contentType: ContentType.success,
                                                    color: Colors.red,

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
                            width: 100,
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
              ),
            ],
          );
        } else {
          return Text('');
        }
      }),
    );
  }

  lunch() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Lunch: ',
              style: TextStyle(
                fontSize: 30,
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
            ],
          ),
        ),
        TextField(
          controller: _lunchController1,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 2,
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        TextField(
          controller: _lunchController2,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 2,
          decoration: InputDecoration(
            icon: Icon(Icons.food_bank_outlined),
            hintText: 'Amount to be taken in grams',
            hintStyle: TextStyle(fontFamily: 'ro'),
          ),
        )
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
                fontSize: 30,
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
            ],
          ),
        ),
        TextField(
          controller: _breakfastController1,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 2,
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        TextField(
          controller: _breakfastController2,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 2,
          decoration: InputDecoration(
            icon: Icon(Icons.food_bank_outlined),
            hintText: 'Amount to be taken in grams',
            hintStyle: TextStyle(fontFamily: 'ro'),
          ),
        )
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
                fontSize: 30,
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
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 2,
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
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            FilteringTextInputFormatter.digitsOnly,
          ],
          maxLength: 2,
          decoration: InputDecoration(
            icon: Icon(Icons.food_bank_outlined),
            hintText: 'Amount to be taken in grams',
            hintStyle: TextStyle(fontFamily: 'ro'),
          ),
        )
      ],
    );
  }

  dinnerfunction() {
    if (_dinnerController1.text.trim().isEmpty &&
        _dinnerController2.text.trim().isNotEmpty) {
      int dinnervalue1 = 0;
      final dinnerTotal = dinnervalue1 + int.parse(_dinnerController2.text);
      dinnerTotal.toString();
      print(dinnerTotal);

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "dinnertotal": dinnerTotal,
        "dinnerController1": dinnervalue1,
        "dinnerController2": _dinnerController2.text.trim().toString(),
      });
    } else if (_dinnerController2.text.trim().isEmpty &&
        _dinnerController1.text.trim().isNotEmpty) {
      int dinnervalue2 = 0;
      final dinnerTotal = int.parse(_dinnerController1.text) + dinnervalue2;
      dinnerTotal.toString();
      print(dinnerTotal);
      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "dinnertotal": dinnerTotal,
        "dinnerController2": dinnervalue2,
        "dinnerController1": _dinnerController1.text.trim().toString(),
      });
    } else if (_dinnerController2.text.trim().isEmpty &&
        _dinnerController1.text.trim().isEmpty) {
      int dinnervalue1 = 0;
      int dinnervalue2 = 0;
      final dinnerTotal = dinnervalue1 + dinnervalue2;
      dinnerTotal.toString();
      print(dinnerTotal);
      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "dinnertotal": dinnerTotal,
        "dinnerController2": dinnervalue2,
        "dinnerController1": dinnervalue1,
      });
    } else {
      int dinnerTotal = int.parse(_dinnerController1.text) +
          int.parse(_dinnerController2.text);

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "dinnertotal": dinnerTotal,
        "dinnerController1": _dinnerController1.text.trim().toString(),
        "dinnerController2": _dinnerController2.text.trim().toString(),
      });
    }
  }

  breakfastfunction() {
    if (_breakfastController1.text.trim().isEmpty &&
        _breakfastController2.text.trim().isNotEmpty) {
      int breakfastalue1 = 0;
      final breakfastTotal =
          breakfastalue1 + int.parse(_breakfastController2.text);

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "breakfasttotal": breakfastTotal,
        "breakfastcontroller1": breakfastalue1,
        "breakfastcontroller2": _breakfastController2.text.trim().toString(),
      });
    } else if (_breakfastController2.text.trim().isEmpty &&
        _breakfastController1.text.trim().isNotEmpty) {
      int breakfastalue2 = 0;
      final breakfastTotal =
          int.parse(_breakfastController1.text) + breakfastalue2;

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "breakfasttotal": breakfastTotal,
        "breakfastcontroller2": breakfastalue2,
        "breakfastcontroller1": _breakfastController1.text.trim().toString(),
      });
    } else if (_breakfastController1.text.trim().isEmpty &&
        _breakfastController2.text.trim().isEmpty) {
      int breakfastalue1 = 0;
      int breakfastalue2 = 0;
      final breakfastTotal = breakfastalue1 + breakfastalue2;

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "breakfasttotal": breakfastTotal,
        "breakfastcontroller2": breakfastalue2,
        "breakfastcontroller1": breakfastalue1,
      });
    } else {
      int breakfastTotal = int.parse(_breakfastController1.text) +
          int.parse(_breakfastController2.text);

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "breakfasttotal": breakfastTotal,
        "breakfastcontroller1": _breakfastController1.text.trim().toString(),
        "breakfastcontroller2": _breakfastController2.text.trim().toString(),
      });
    }
  }

  lunchfunction() {
    if (_lunchController1.text.trim().isEmpty &&
        _lunchController2.text.trim().isNotEmpty) {
      int lunchvalue1 = 0;
      final lunchtotal = lunchvalue1 + int.parse(_breakfastController2.text);

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "breakfasttotal": lunchtotal,
        "lunchcontroller1": lunchvalue1,
        "lunchcontroller2": _lunchController2.text.trim().toString(),
      });
    } else if (_lunchController2.text.trim().isEmpty &&
        _lunchController1.text.trim().isNotEmpty) {
      int lunchvalue2 = 0;
      final lunchTotal = int.parse(_lunchController1.text) + lunchvalue2;

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "lunchtotal": lunchTotal,
        "lunchcontroller2": lunchvalue2,
        "lunchcontroller1": _lunchController1.text.trim().toString(),
      });
    } else if (_lunchController1.text.trim().isEmpty &&
        _lunchController2.text.trim().isEmpty) {
      int lunchvalue1 = 0;
      int lunchvalue2 = 0;
      final lunchTotal = lunchvalue1 + lunchvalue2;

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "lunchtotal": lunchTotal,
        "lunchcontroller2": lunchvalue2,
        "lunchcontroller1": lunchvalue1,
      });
    } else {
      int lunchTotal =
          int.parse(_lunchController1.text) + int.parse(_lunchController2.text);

      final docUser =
          FirebaseFirestore.instance.collection("users").doc(widget.documentId);
      docUser.update({
        "lunchtotal": lunchTotal,
        "lunchcontroller1": _lunchController1.text.trim().toString(),
        "lunchcontroller2": _lunchController2.text.trim().toString(),
      });
    }
  }
}
