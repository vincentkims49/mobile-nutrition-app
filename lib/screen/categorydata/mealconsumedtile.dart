import 'package:flutter/material.dart';
import 'package:recipe/model/meal-consumed.dart';

Widget mealConsumedTile(MealConsumed mealConsumed) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: double.infinity,
    ),
    child: Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        value: mealConsumed.progressValue! / 100,
                        backgroundColor: Colors.blue.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      mealConsumed.mealName!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      mealConsumed.mealAmount!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 1),
                    Text(
                      'kcal',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            itemCount: mealConsumed.consumedFoods!.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 70,
                margin: EdgeInsets.zero,
                child: IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      VerticalDivider(
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                            color: mealConsumed.consumedFoods![index].boxColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: mealConsumed.consumedFoods![index].image),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mealConsumed.consumedFoods![index].foodName!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            mealConsumed.consumedFoods![index].consumedAmount!,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ])),
              );
            },
          ),
        ],
      ),
    ),
  );
}
