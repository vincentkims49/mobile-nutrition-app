import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';

PreferredSizeWidget appbar(context) {
  return AppBar(
    title: Center(child: Text("Mobile Nutrition")),
    
    backgroundColor: maincolor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
  );
}
