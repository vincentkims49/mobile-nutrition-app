import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:recipe/model/food-consumed.dart';
import 'package:recipe/screen/categorydata/detailed_meal_consumed.dart';
import 'package:recipe/screen/categorydata/mealconsumed.dart';
import 'package:recipe/screen/categorydata/statistics.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/screens/sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<FoodConsumed> consumedFoods = [];
  @override
  void didChangeDependencies() {
    provideConsumedFoods();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      drawer: Navbar(),
      appBar: AppBar(
        title: Center(child: Text("Eat Healthy")),
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Today,',
                style: TextStyle(
                    color: Color.fromARGB(255, 75, 73, 73),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 7),
              Text(
                'Wed, 18 Aug',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 260,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(right: 5, left: 5),
                  children: [
                    InkWell(
                      onTap: () {},
                      child: AspectRatio(
                        aspectRatio: 1.4,
                        child: Container(
                          padding: EdgeInsets.all(50),
                          margin: EdgeInsets.only(bottom: 80),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 55, 55),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _circleProgress(),
                              _macronutrients(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AspectRatio(
                aspectRatio: 2,
                child: Container(
                  margin: EdgeInsets.only(bottom: 70, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      statisticsTile(
                        title: 'Intaked',
                        icon: FaIcon(
                          FontAwesomeIcons.pizzaSlice,
                          color: Colors.orange,
                        ),
                        progressColor: Colors.blue,
                        value: 589,
                        progressPercent: 0.4,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      statisticsTile(
                        title: 'Burned',
                        icon: FaIcon(
                          FontAwesomeIcons.fire,
                          color: Colors.red,
                        ),
                        progressColor: Colors.redAccent,
                        value: 738,
                        progressPercent: 0.7,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              consumed_meal(consumedFoods: consumedFoods),
              SizedBox(
                height: 5,
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Detailed',
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
        ),
      ),
    );
  }

  Widget _circleProgress() {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              value: 0.7,
              backgroundColor: Colors.white.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: Colors.white.withOpacity(0.2), width: 8),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
                child: Container(
                  margin: EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Remaining',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '1,112',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'kcal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _macronutrients() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _macronutrientsTile(
            title: 'Carbs', percentValue: 0.4, amountInGram: '14/323g'),
        _macronutrientsTile(
            title: 'Proteins', percentValue: 0.8, amountInGram: '14/129g'),
        _macronutrientsTile(
            title: 'Fats', percentValue: 0.6, amountInGram: '14/85g')
      ],
    );
  }

  Widget _macronutrientsTile(
      {String? title, double? percentValue, String? amountInGram}) {
    return SizedBox(
      height: 50,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          LinearPercentIndicator(
            width: 120,
            animation: true,
            lineHeight: 6,
            animationDuration: 2500,
            percent: percentValue!,
            barRadius: Radius.circular(3),
            progressColor: Colors.white,
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white.withOpacity(0.2),
          ),
          Text(
            amountInGram!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void provideConsumedFoods() {
    consumedFoods.add(
      FoodConsumed(
        foodName: 'Espresso coffe',
        consumedAmount: '30 ml',
        boxColor: maincolor,
      ),
    );

    consumedFoods.add(
      FoodConsumed(
        foodName: 'Croissant',
        consumedAmount: '100 g',
        boxColor: maincolor,
      ),
    );
  }
}
