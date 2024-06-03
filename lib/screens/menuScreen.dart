import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized(); //Инициализация базы данных
    await Firebase.initializeApp(); //Подключение к базе данных
  }

  @override
  void initState() {
    super.initState();

    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('assets/back_menu.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 40, left: 110),
            child: Text(
              'ДЕТСКОЕ',
              style: TextStyle(
                fontFamily: 'InterExtraBold',
                fontSize: 94,
                color: HexColor('#F4E6C6'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 145, left: 310),
            child: Text(
              'МЕНЮ',
              style: TextStyle(
                fontFamily: 'InterExtraBold',
                fontSize: 94,
                color: HexColor('#F4E6C6'),
              ),
            ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('items').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.only(left: 100, right: 100, top: 500),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  // if (index % 2 == 0) {
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
                  // } else {
                  //   return Row(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.fromLTRB(
                  //             0, 10, 0, 10),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 Text(snapshot.data!.docs[index]
                  //                     .get('name'))
                  //               ],
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Text(snapshot.data!.docs[index]
                  //                     .get('description'))
                  //               ],
                  //             ),
                  //             Row(
                  //               children: [
                  //                 Text(
                  //                     "${snapshot.data!.docs[index].get('weight')} гр."),
                  //                 Text(
                  //                     "${snapshot.data!.docs[index].get('price')} руб.")
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //           height: 500,
                  //           width: 500,
                  //           child: Image.network(
                  //             snapshot.data!.docs[index].get(index),
                  //             fit: BoxFit.cover,
                  //           )),
                  //     ],
                  //   );
                  // }
                  // return Dismissible(
                  //     key: Key(snapshot.data!.docs[index].id),
                  //     child: Card(
                  //       child: ListTile(
                  //         title: Image.network(snapshot.data!.docs[index].get(index.to)),
                  //       ),
                  //     ),
                  // ); // TODO: Расположить элементы в шахматном порядке
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(
                                        MyAppRoutesConstants.gameChangeRoute);
                                  },
                                  child: SvgPicture.asset(
                                      'assets/left_button_game.svg',
                                      width: 69.12,
                                      height: 120)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(
                                        MyAppRoutesConstants.menuRoute);
                                  },
                                  child: SvgPicture.asset(
                                      'assets/left_button_food_active.svg',
                                      width: 69.12,
                                      height: 120)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(
                                        MyAppRoutesConstants.movieChangeRoute);
                                  },
                                  child: SvgPicture.asset(
                                      'assets/left_button_movie.svg',
                                      width: 69.12,
                                      height: 120)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GridView.count(
                      padding: const EdgeInsets.only(
                          left: 100, right: 100, top: 180),
                      crossAxisCount: 2,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      childAspectRatio: 1.2 / 1,
                      mainAxisSpacing: 80,
                      children: List.generate(
                          10,
                          (index) => SizedBox(
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      'Это $index карточка',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ), //GridView.count
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                      MyAppRoutesConstants.ageEditRoute);
                                },
                                child: SvgPicture.asset('assets/settings.svg',
                                    width: 90, height: 90)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                      MyAppRoutesConstants.menuItemRoute);
                                },
                                child: SvgPicture.asset('assets/sound.svg',
                                    width: 90, height: 90)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
