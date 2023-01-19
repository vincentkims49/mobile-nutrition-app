import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/logins/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'images/abblack.png',
      ),
      title: Text(
        'Mobile Nutrition ',
        style: GoogleFonts.bebasNeue(
          color: Colors.red,
          fontSize: 20,
        ),
      ),
      backgroundColor: background,
      showLoader: true,
      loaderColor: Colors.red,
      navigator: MainPage(),
      durationInSeconds: 3,
    );
  }
}
