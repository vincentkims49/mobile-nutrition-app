
import 'package:recipe/model/food-consumed.dart';
class MealConsumed {
  final List<FoodConsumed> ? consumedFoods;
  final String ? mealName;
  final String ? mealAmount;
  final double ? progressValue;
  MealConsumed({this.consumedFoods,this.mealName,this.mealAmount,this.progressValue});
}