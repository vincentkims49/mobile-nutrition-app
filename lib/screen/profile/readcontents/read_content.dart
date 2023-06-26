import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe/screen/consent/colors.dart';
import 'package:recipe/screen/consent/navigation.dart';

// ignore: must_be_immutable
class GetData extends StatelessWidget {
  GetData({
    super.key,
    required this.documentId,
  });

  final String documentId;

  final _firstName = TextEditingController();
  final _lastname = TextEditingController();
  List<String> docIDs = [];
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          _firstName.text = data['first name'];
          _lastname.text = data['last name'];

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: maincolor,
                          width: 2,
                        ),
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
                          image: NetworkImage('${data['imageurl']}'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? file = await imagePicker.pickImage(
                              source: ImageSource.camera);
                          print('${file?.path}');
                          if (file == null) return;

                          String uniqueFileName =
                              DateTime.now().microsecondsSinceEpoch.toString();

                          Reference referencRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDirImages =
                              referencRoot.child('images');

                          Reference referenceImageToUpload =
                              referenceDirImages.child(uniqueFileName);
                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              contentType: ContentType.success,
                              color: Colors.red,
                              message: 'Any image changes will be UPDATED!',
                              title: 'Hello There!',
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                          try {
                            await referenceImageToUpload.putFile(
                              File(file.path),
                            );
                            String imageUrl =
                                await referenceImageToUpload.getDownloadURL();

                            final docUser = FirebaseFirestore.instance
                                .collection("users")
                                .doc(documentId);
                            docUser.update(
                              {
                                "imageurl": imageUrl,
                              },
                            );
                          } catch (error) {}
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: maincolor, width: 2),
                            color: background,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Enter Your new data below",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: _firstName,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintStyle: TextStyle(fontFamily: 'ro'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: _lastname,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintStyle: TextStyle(fontFamily: 'ro'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  final docUser = FirebaseFirestore.instance
                      .collection("users")
                      .doc(documentId);
                  docUser.update({
                    "first name": _firstName.text,
                    "last name": _lastname.text,
                  });

                  final snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    content: AwesomeSnackbarContent(
                      color: Colors.red,
                      contentType: ContentType.success,
                      message: 'Any data changes will be UPDATED!',
                      title: 'Hello There!',
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Navigation())));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: maincolor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text('');
        }
      }),
    );
  }

  Future picker() async {}
}
