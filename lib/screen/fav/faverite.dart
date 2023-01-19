import 'package:flutter/material.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/fav/provider/favorite_provider.dart';
import 'package:recipe/screen/screens/sidebar.dart';

class favorite extends StatelessWidget {
  const favorite({super.key});

  get font => null;

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final words = provider.words;
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Center(child: Text("Your Favorites")),
       
        backgroundColor: maincolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      backgroundColor: background,
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return ListTile(
            title: Text(word),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(word);
              },
              icon: provider.isExist(word)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
