import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: maincolor,
      child: Text(text),
    );
  }
}
