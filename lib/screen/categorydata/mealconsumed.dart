import 'package:flutter/material.dart';
import 'package:recipe/model/food-consumed.dart';

class consumed_meal extends StatelessWidget {
  const consumed_meal({
    Key? key,
    required this.consumedFoods,
  }) : super(key: key);

  final List<FoodConsumed> consumedFoods;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
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
                          value: 0.7,
                          backgroundColor: Colors.green.withOpacity(0.2),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Breakfast',
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
                        '407',
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
              itemCount: consumedFoods.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 60,
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
                              color: consumedFoods[index].boxColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(child: consumedFoods[index].icon),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              consumedFoods[index].foodName!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              consumedFoods[index].consumedAmount!,
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
