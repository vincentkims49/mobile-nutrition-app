import 'package:flutter/widgets.dart';
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

class Recipe {
  final String title;
  final Widget page;

  const Recipe({
    required this.title,
    required this.page,
  });
}

List<Recipe> allRecipe = [
  Recipe(
    title: '1. Pizza',
    page: Pizza(),
  ),
  Recipe(
    title: '2. Steak',
    page: Steak_burger(),
  ),
  Recipe(
    title: '3. Pasta',
    page: Pasta_burger(),
  ),
  Recipe(
    title: '4. Burger',
    page: Lunch_burger(),
  ),
  Recipe(
    title: '5. Chips Burger',
    page: Dinner_burger(),
  ),
  Recipe(
    title: '6. Minced Meat',
    page: Mincedmeat_dinner(),
  ),
  Recipe(
    title: '7. Cheese pie Meat',
    page: Cheesepie_dinner(),
  ),
  Recipe(
    title: '8. Grilled Meat',
    page: Grilledmeat_dinner(),
  ),
  Recipe(
    title: '9. Pancake',
    page: Pancake_fast(),
  ),
  Recipe(
    title: '10. Egg curry',
    page: Eggcurry_fast(),
  ),
  Recipe(
    title: '11. Banana chips',
    page: Bananachips_fast(),
  ),
  Recipe(
    title: '12. Rice Eggs',
    page: Riceeggs_fast(),
  ),
];
