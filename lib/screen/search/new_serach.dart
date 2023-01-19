import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/recipes/dinner/dinner_burger.dart';
import 'package:recipe/screen/recipes/dinner/dinner_cheesepie.dart';
import 'package:recipe/screen/recipes/dinner/dinner_grilledmeat.dart';
import 'package:recipe/screen/recipes/dinner/dinner_minced.dart';
import 'package:recipe/screen/recipes/fast/fast_bananachips.dart';
import 'package:recipe/screen/recipes/fast/fast_eggcurry.dart';
import 'package:recipe/screen/recipes/fast/fast_pancake.dart';
import 'package:recipe/screen/recipes/fast/fast_riceeggs.dart';
import 'package:recipe/screen/recipes/lunch/lunch_burger.dart';
import 'package:recipe/screen/recipes/lunch/lunch_pasta.dart';
import 'package:recipe/screen/recipes/lunch/lunch_pizza.dart';
import 'package:recipe/screen/recipes/lunch/lunch_steak.dart';
import 'package:recipe/screen/screens/sidebar.dart';

class New_Search extends StatefulWidget {
  const New_Search({super.key});

  @override
  State<New_Search> createState() => _New_SearchState();
}

class _New_SearchState extends State<New_Search> {
  //Holds list of items

  final List<Map<String, dynamic>> _allListTems = [
    {
      "id": 1,
      "name": "Pizza",
      "page": Pizza(),
      "nam": "Pizza",
      "image": "images/lunch0.jpg",
    },
    {
      "id": 2,
      "name": "Steak",
      "page": Steak_burger(),
      "nam": "Steak",
      "image": "images/lunch1.jpg",
    },
    {
      "id": 3,
      "name": "Pasta",
      "page": Pasta_burger(),
      "nam": "Pasta",
      "image": "images/lunch2.jpg",
    },
    {
      "id": 4,
      "name": "Burger",
      "page": Lunch_burger(),
      "nam": "Burger",
      "image": "images/lunch3.jpg",
    },
    {
      "id": 5,
      "name": "Chips Burger",
      "page": Dinner_burger(),
      "nam": "Chips Burger",
      "image": "images/dinner0.jpg",
    },
    {
      "id": 6,
      "name": "Minced Meat",
      "page": Mincedmeat_dinner(),
      "nam": "Minced Meat",
      "image": "images/dinner1.jpg",
    },
    {
      "id": 7,
      "name": "Cheese pie Meat",
      "page": Cheesepie_dinner(),
      "nam": "Cheese pie Meat",
      "image": "images/dinner2.jpg",
    },
    {
      "id": 8,
      "name": "Grilled Meat",
      "page": Grilledmeat_dinner(),
      "nam": "Grilled Meat",
      "image": "images/dinner3.jpg",
    },
    {
      "id": 9,
      "name": "Pancake",
      "page": Pancake_fast(),
      "nam": "Pancake",
      "image": "images/fast0.jpg",
    },
    {
      "id": 10,
      "name": "Egg curry",
      "page": Eggcurry_fast(),
      "nam": "Egg curry",
      "image": "images/fast1.jpg",
    },
    {
      "id": 11,
      "name": "Banana chips",
      "page": Bananachips_fast(),
      "nam": "Banna chips",
      "image": "images/fast2.jpg",
    },
    {
      "id": 12,
      "name": "Rice Eggs",
      "page": Riceeggs_fast(),
      "nam": "Rice Eggs",
      "image": "images/fast3.jpg",
    },
  ];
  //Holds data in listview
  List<Map<String, dynamic>> _foundItems = [];
  @override
  void initState() {
    //at first show all items
    _foundItems = _allListTems;
    super.initState();
  }

  //call this function whenever text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      //show all items
      results = _allListTems;
    } else {
      results = _allListTems
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    //refresh
    setState(() {
      _foundItems = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      drawer: Navbar(),
      appBar: AppBar(
        title: Center(child: Text("Search Meals")),
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            //Textfield
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundItems.length,
                      itemBuilder: ((context, index) => Card(
                            key: ValueKey(_foundItems[index]["id"]),
                            color: Colors.amber[100],
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            //navigation
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        _foundItems[index]['page'],
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Text(
                                  _foundItems[index]["id"].toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                title: Text(
                                  _foundItems[index]["name"],
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          )),
                    )
                  : Text(
                      "No results found",
                      style: TextStyle(fontSize: 20),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
