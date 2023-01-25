import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/fav/provider/favorite_provider.dart';
import 'package:recipe/screen/home/appbanner.dart';
import 'package:recipe/screen/home/banner_itmes.dart';
import 'package:recipe/screen/home/indicator.dart';
import 'package:recipe/screen/recipes/dinner/dinner_burger.dart';
import 'package:recipe/screen/recipes/dinner/dinner_cheesepie.dart';
import 'package:recipe/screen/recipes/dinner/dinner_grilledmeat.dart';
import 'package:recipe/screen/recipes/dinner/dinner_minced.dart';
import 'package:recipe/screen/recipes/fast/fast_bananachips.dart';
import 'package:recipe/screen/recipes/fast/fast_eggcurry.dart';
import 'package:recipe/screen/recipes/fast/fast_pancake.dart';
import 'package:recipe/screen/recipes/fast/fast_riceeggs.dart';
import 'package:recipe/screen/recipes/lunch/lunch_burger.dart';
import 'package:recipe/screen/recipes/lunch/lunch_pasta.dart';
import 'package:recipe/screen/recipes/lunch/lunch_pizza.dart';
import 'package:recipe/screen/recipes/lunch/lunch_steak.dart';

import 'package:recipe/screen/screens/sidebar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indexx = 0;
  List category = ['Lunch', 'Dinner', 'Breackfast'];
  List categoryname = ['lunch', 'dinner', 'fast'];
  List food = [
    ['Pizza', 'Steak', 'Pasta', 'Burger'],
    ['Chips Burger', 'Minced Meat', 'Cheese pie Meat', 'Grilled Meat'],
    ['Pancake', 'Egg curry', 'Banana chips', 'Rice Eggs'],
  ];
  List time = [
    ['68 min', '50 min', '40 min', '35 min'],
    ['30 min', '35 min', '40 min', '35 min'],
    ['20 min', '15 min', '40 min', '35 min'],
  ];
  List starz = [
    ['4.3', '4.9', '4.3', '4.9'],
    ['4.2', '4.7', '4.3', '4.9'],
    ['4.3', '4.8', '4.3', '4.9'],
  ];
  List screen = [
    [Pizza(), Steak_burger(), Pasta_burger(), Lunch_burger()],
    [
      Dinner_burger(),
      Mincedmeat_dinner(),
      Cheesepie_dinner(),
      Grilledmeat_dinner()
    ],
    [Pancake_fast(), Eggcurry_fast(), Bananachips_fast(), Riceeggs_fast()],
  ];
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      backgroundColor: background,
      drawer: Navbar(),
      appBar: AppBar(
        title: Center(child: Text("Best Meals")),
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Container(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 360),
                      child: Text(
                        'Welcome,',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 40,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 230),
                      child: Text(
                        'To Mobile Nutrition App',
                        style: TextStyle(
                          fontSize: 25,
                          color: font,
                          fontFamily: 'ro',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      height: 180,
                      child: PageView.builder(
                        onPageChanged: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        controller: PageController(viewportFraction: 0.7),
                        itemCount: appBannerList.length,
                        itemBuilder: (context, index) {
                          var banner = appBannerList[index];
                          var _scale = _selectedIndex == index ? 1.0 : 0.8;
                          return TweenAnimationBuilder(
                            duration: Duration(milliseconds: 350),
                            tween: Tween(begin: _scale, end: _scale),
                            curve: Curves.ease,
                            child: BannerItem(
                              appBanner: banner,
                            ),
                            builder: (context, value, child) {
                              // ignore: unnecessary_null_comparison
                              assert(value != null);
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          appBannerList.length,
                          (index) => Indicator(
                            isActive: _selectedIndex == index ? true : false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 20,
                    color: font,
                    fontFamily: 'ro',
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  indexx = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: index == 0 ? 4 : 0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: indexx == index
                                      ? maincolor
                                      : Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: indexx == index
                                          ? maincolor
                                          : Colors.transparent,
                                      offset: indexx == index
                                          ? Offset(1, 1)
                                          : Offset(0, 0),
                                      blurRadius: indexx == index ? 7 : 0,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 17),
                                    child: Text(
                                      category[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: indexx == index
                                            ? Colors.white
                                            : font,
                                        fontFamily: 'ro',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Best and tasty!',
                          style: TextStyle(
                            fontSize: 20,
                            color: font,
                            fontFamily: 'ro',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  screen[indexx][index]),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 185, 185, 185),
                              offset: Offset(1, 1),
                              blurRadius: 15,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: provider.isExist(food[indexx][index])
                                        ? const Icon(Icons.favorite,
                                            color: Colors.red)
                                        : const Icon(Icons.favorite_border),
                                    onPressed: () {
                                      provider
                                          .toggleFavorite(food[indexx][index]);
                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/${categoryname[indexx]}${index}.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              food[indexx][index],
                              style: TextStyle(
                                fontSize: 18,
                                color: font,
                                fontFamily: 'ro',
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  time[indexx][index],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontFamily: 'ro',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: maincolor, size: 15),
                                    Text(
                                      starz[indexx][index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontFamily: 'ro',
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 4,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 270,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
