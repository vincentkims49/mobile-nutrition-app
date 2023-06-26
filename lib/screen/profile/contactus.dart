import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/appbar.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/consent/navigation.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Contactus extends StatelessWidget {
  Contactus({super.key});

  get font => null;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final smsController = TextEditingController();
  final thisUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Contact us ',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'ro',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'We are always available',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ro',
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontFamily: 'ro'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: smsController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Text',
                    hintStyle: TextStyle(fontFamily: 'ro'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                if (emailController.text.isEmpty) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    headerAnimationLoop: false,
                    title: 'Oh Snap!',
                    desc: 'Please fill the empty fields!.',
                    btnOkOnPress: () {},
                    btnOkIcon: Icons.cancel,
                    btnOkColor: Colors.red,
                  ).show();
                } else if (emailController.text.trim() != thisUser.email) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    headerAnimationLoop: false,
                    title: 'Oh Snap!',
                    desc: 'Please use the email that you signed up with.',
                    btnOkOnPress: () {},
                    btnOkIcon: Icons.cancel,
                    btnOkColor: Colors.red,
                  ).show();
                } else if (smsController.text.isEmpty) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    headerAnimationLoop: false,
                    title: 'Oh Snap!',
                    desc: 'Please fill the empty fields!.',
                    btnOkOnPress: () {},
                    btnOkIcon: Icons.cancel,
                    btnOkColor: Colors.red,
                  ).show();
                } else {
                  final snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      color: Colors.red,
                      contentType: ContentType.success,
                      message:
                          'Thank you for contactig us. Your message will be reviewed within 1 to 2 business days!',
                      title: 'Hello There!',
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Navigation())));
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                  color: maincolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
