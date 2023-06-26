import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/screens/sidebar.dart';
import 'package:recipe/screen/search/recipe.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();
  List<Recipe> recipes = allRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Center(child: Text("Search Your Meal")),
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      backgroundColor: background,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: TextStyle(fontFamily: 'ro'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: searchRecipe,
              ),
            ),
          ),
          Expanded(
            child: recipes.isNotEmpty
                ? ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      Colors.amber[100];
                      4;
                      EdgeInsets.symmetric(vertical: 10);
                      final recipe = recipes[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: ListTile(
                              title: Text(recipe.title),
                              tileColor: Colors.blue[50],
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        recipe.page,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Lottie.asset(
                    'images/empty.json',
                    width: 300,
                    height: 300,
                  ),
          ),
        ],
      ),
    );
  }

  void searchRecipe(String query) {
    final suggestions = allRecipe.where(
      (recipe) {
        final recipeTitle = recipe.title.toLowerCase();
        final input = query.toLowerCase();

        return recipeTitle.contains(input);
      },
    ).toList();

    setState(() {
      recipes = suggestions;
    });
  }
}
