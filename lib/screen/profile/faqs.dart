import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/appbar.dart';
import 'package:recipe/screen/consent/colors.dart';

class Faqs extends StatelessWidget {
  const Faqs({super.key});

  get font => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: appbar(context),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '1. Do you prefer home cooked meal or fast food?\n\n2. Do you cook?\n\n3. Do you cook by/for yourself or do you do this with/for somebody else?\n\n4. Are you skilled at cooking?\n\n5. How often do you cook?\n\n6. What kind of meals do you prepare?\n\n7. Easy, intermediate or elaborate?\n\n8. How often do you know exactly what you want to cook?\n\n9. When it comes to shopping do you know exactly what you want to prepare before getting the groceries or do you just buy the essential products and then figure out what to cook?\n\n10. How much time does it take you to decide on the exact meal/recipe?\n\n11. Do you like traditional recipes or do you like to experiment with more unfamiliar meals?\n\n12. Do you collect different recipes?\n\n13. What kind of foreign cuisine do you prefer?',
                  style: TextStyle(
                    fontSize: 20,
                    color: font,
                    fontFamily: 'R',
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
