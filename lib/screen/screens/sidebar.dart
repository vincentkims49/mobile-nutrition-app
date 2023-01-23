import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/screen/consent/navigation.dart';
import 'package:recipe/screen/tolearn/pages/home_page.dart';

class Navbar extends StatelessWidget {
  Navbar({
    super.key,
  });
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Welcome To Mobile Nutrition',
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            accountEmail: Text("Signed in as: \n" + user!.email!),
            currentAccountPicture: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 10),
                  ),
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/ab.png'),
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/backs.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.line_style_rounded),
            title: Text("My Activity list"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => ToLearn())));
            },
          ),
          /*ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Request"),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 15,
                height: 15,
                child: Center(
                  child: Text(
                    "7",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          ),*/
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app_rounded),
            title: Text("Back"),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => Navigation())));
            },
          ),
        ],
      ),
    );
  }
}
