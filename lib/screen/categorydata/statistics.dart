import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget statisticsTile(
    {Color? progressColor,
    String? title,
    FaIcon? icon,
    double? value,
    double? progressPercent,
    String? unitName}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title!,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              icon!,
            ],
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: LinearPercentIndicator(
                  width: 60,
                  animation: true,
                  lineHeight: 6,
                  animationDuration: 2500,
                  percent: progressPercent!,
                  barRadius: Radius.circular(3),
                  progressColor: progressColor!,
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.blue.withOpacity(0.4),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    unitName ?? 'kCal',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}
