// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:recipe/screen/categorydata/detailed_meal_consumed.dart';
// import 'package:recipe/screen/categorydata/statistics.dart';

// class RoundBar extends StatefulWidget {
//   RoundBar({super.key, required this.documentId});
//   final String documentId;

//   @override
//   State<RoundBar> createState() => _RoundBarState();
// }

// class _RoundBarState extends State<RoundBar> {
//   List<String> docIDs = [];
//   Future getDocId() async {
//     await FirebaseFirestore.instance
//         .collection("users")
//         .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email)
//         .get()
//         .then(
//           (snapshot) => snapshot.docs.forEach(
//             (document) {
//               print(document.reference);
//               docIDs.add(document.reference.id);
//             },
//           ),
//         );
//   }

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference user = FirebaseFirestore.instance.collection('users');
//     return FutureBuilder<DocumentSnapshot>(
//       future: user.doc(widget.documentId).get(),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           if (data['dinnertotal'] == null) {
//             return Container(
//               height: 10,
//               child: Expanded(
//                 child: ListView(
//                   physics: const NeverScrollableScrollPhysics(),
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 10.0, left: 10),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: ((context) =>
//                                   Detailed_meal_consumed())));
//                         },
//                         child: Row(
//                           children: [
//                             Text(
//                               'Please click',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               ' here ',
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               'to Start',
//                               style: TextStyle(
//                                   color: Colors.blue,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           } else {
//             // int totakcal = data['dinnertotal'] +
//             //     data['breakfasttotal'] +
//             //     data['lunchtotal'];

//             return Container(
//               child: Column(
//                   // physics: BouncingScrollPhysics(),
//                   children: [
//                     // ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Expanded(
//                       child: AspectRatio(
//                         aspectRatio: 2,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               statisticsTile(
//                                 title: 'Intaked',
//                                 icon: FaIcon(
//                                   FontAwesomeIcons.pizzaSlice,
//                                   color: Colors.orange,
//                                 ),
//                                 progressColor: Colors.blue,
//                                 value: 589,
//                                 progressPercent: 0.4,
//                               ),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               statisticsTile(
//                                 title: 'Burned',
//                                 icon: FaIcon(
//                                   FontAwesomeIcons.fire,
//                                   color: Colors.red,
//                                 ),
//                                 progressColor: Colors.redAccent,
//                                 value: 738,
//                                 progressPercent: 0.7,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]),
//             );
//           }
//         } else {
//           return Text('');
//         }
//       }),
//     );
//   }
// }
