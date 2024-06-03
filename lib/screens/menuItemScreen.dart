import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/item.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized(); //Инициализация базы данных
    await Firebase.initializeApp(); //Подключение к базе данных
  }

  @override
  void initState() {
    super.initState();

    initFirebase();
  }

  Future<List<Item>> getItems() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('items').get();
    return snapshot.docs
        .map((doc) => Item.fromMap(doc.data as Map<String, dynamic>))
        .toList();
  }

  // List<Profile> demoProfiles = [];
  //
  // demoProfiles = fetchData();
  //
  // Final MatchEngine match Engine = MatchEngine (
  //     matches:demoProfiles.map((Profile profile) => Match(profile: profile)).toList();
  // );
  //
  // fetchData() async{
  //   final db = await Firestore.instance;
  //   List<Profile> list = [];
  //   db.collection("Profile").get().then(function(snapshot){
  //   snapshot.forEach((document) {
  //   list.add(Profile(
  //   photos: document.data.photos,
  //   name: document.data.name,
  //   age: document.data.age,
  //   distance: document.data.distance,
  //   education: document.data.education
  //   ))
  //   })
  //   });
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Image(
              image: AssetImage('assets/back_menu.jpg'),
              fit: BoxFit.cover,
            ),
            SizedBox(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('items').snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(150, 400, 100, 0),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index % 2 == 0) {
                          return Row(
                            children: [
                              Expanded(
                                  child: Image.network(
                                snapshot.data!.docs[index].get('url'),
                                fit: BoxFit.cover,
                              )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index].get('name'),
                                            style: TextStyle(
                                                fontSize: 45,
                                                color: HexColor("#F4E6C6")),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: Text(
                                            snapshot.data!.docs[index]
                                                .get('description'),
                                            style: const TextStyle(
                                                fontSize: 30, color: Colors.white),
                                          ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${snapshot.data!.docs[index].get('weight')} гр.",
                                            style: const TextStyle(
                                                fontSize: 25, color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "${snapshot.data!.docs[index].get('price')} руб.",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: HexColor("#F4E6C6")),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index].get('name'),
                                            style: TextStyle(
                                                fontSize: 45,
                                                color: HexColor("#F4E6C6")),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                              child: Text(
                                            snapshot.data!.docs[index]
                                                .get('description'),
                                            style: const TextStyle(
                                                fontSize: 30, color: Colors.white),
                                          ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${snapshot.data!.docs[index].get('weight')} гр.",
                                            style: const TextStyle(
                                                fontSize: 25, color: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "${snapshot.data!.docs[index].get('price')} руб.",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: HexColor("#F4E6C6")),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Image.network(
                                snapshot.data!.docs[index].get('url'),
                                fit: BoxFit.cover,
                              )),
                            ],
                          );
                        }
                        ;
                        // return Dismissible(
                        //     key: Key(snapshot.data!.docs[index].id),
                        //     child: Card(
                        //       child: ListTile(
                        //         title: Image.network(snapshot.data!.docs[index].get(index.to)),
                        //       ),
                        //     ),
                        //); // TODO: Расположить элементы в шахматном порядке
                      },
                    );
                  },
                ),
            ),
          ],
        )

            // GridView.count(
            //   padding: const EdgeInsets.only(
            //       left: 100, right: 100, top: 180),
            //   crossAxisCount: 2,
            //   physics: const ScrollPhysics(),
            //   shrinkWrap: true,
            //   childAspectRatio: 1.2 / 1,
            //   mainAxisSpacing: 80,
            //   children: List.generate(
            //       10,
            //           (index) => SizedBox(
            //         child: Card(
            //           elevation: 0,
            //           color: Colors.transparent,
            //           child: Center(
            //             child: Text(
            //               'Это $index карточка',
            //               style: const TextStyle(
            //                 fontSize: 20,
            //                 fontFamily: 'Montserrat',
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //       )),
            // ),
            //   StreamBuilder(
            //   stream: FirebaseFirestore.instance.collection('items').snapshots(),
            //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (!snapshot.hasData) return const Text('Нет записей');
            //     return ListView.builder(
            //       itemCount: snapshot.data?.docs.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         // if (index % 2 == 0) {
            //         return Row(
            //           children: [
            //             Expanded(
            //                 child: Image.network(
            //               snapshot.data!.docs[index].get('url'),
            //               fit: BoxFit.cover,
            //             )),
            //             Expanded(
            //               child: Padding(
            //                 padding: const EdgeInsets.all(20),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Text(
            //                           snapshot.data!.docs[index].get('name'),
            //                           style: const TextStyle(fontSize: 45),
            //                         )
            //                       ],
            //                     ),
            //                     Row(
            //                       children: [
            //                         Flexible(
            //                             child: Text(
            //                           snapshot.data!.docs[index].get('description'),
            //                           style: const TextStyle(fontSize: 30),
            //                         ))
            //                       ],
            //                     ),
            //                     Row(
            //                       children: [
            //                         Text(
            //                           "${snapshot.data!.docs[index].get('weight')} гр.",
            //                           style: const TextStyle(fontSize: 25),
            //                         ),
            //                         const SizedBox(
            //                           width: 20,
            //                         ),
            //                         Text(
            //                           "${snapshot.data!.docs[index].get('price')} руб.",
            //                           style: const TextStyle(fontSize: 30),
            //                         )
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         );
            //         // } else {
            //         //   return Row(
            //         //     children: [
            //         //       Padding(
            //         //         padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            //         //         child: Column(
            //         //           children: [
            //         //             Row(
            //         //               children: [
            //         //                 Text(snapshot.data!.docs[index].get('name'))
            //         //               ],
            //         //             ),
            //         //             Row(
            //         //               children: [
            //         //                 Text(snapshot.data!.docs[index].get('description'))
            //         //               ],
            //         //             ),
            //         //             Row(
            //         //               children: [
            //         //                 Text(
            //         //                     "${snapshot.data!.docs[index].get('weight')} гр."),
            //         //                 Text(
            //         //                     "${snapshot.data!.docs[index].get('price')} руб.")
            //         //               ],
            //         //             )
            //         //           ],
            //         //         ),
            //         //       ),
            //         //       Container(
            //         //           height: 500,
            //         //           width: 500,
            //         //           child: Image.network(
            //         //             snapshot.data!.docs[index].get(index),
            //         //             fit: BoxFit.cover,
            //         //           )),
            //         //     ],
            //         //   );
            //         // }
            //         // return Dismissible(
            //         //     key: Key(snapshot.data!.docs[index].id),
            //         //     child: Card(
            //         //       child: ListTile(
            //         //         title: Image.network(snapshot.data!.docs[index].get(index.to)),
            //         //       ),
            //         //     ),
            //         // );
            //       },
            //     );
            //   },
            // ),
            ),
      );
  }
}
