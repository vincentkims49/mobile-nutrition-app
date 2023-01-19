import 'package:flutter/material.dart';
import 'package:recipe/screen/home/appbanner.dart';

class BannerItem extends StatelessWidget {
  final AppBanner appBanner;
  const BannerItem({
    Key? key,
    required this.appBanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(appBanner.pic),
          fit: BoxFit.cover,
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "".toUpperCase(),
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      "",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
