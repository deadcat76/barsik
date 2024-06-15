import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized(); //Инициализация базы данных
    await Firebase.initializeApp(); //Подключение к базе данных
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 55, right: 25),
        width: double.infinity,
        height: 6690,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/back_menu.jpg'))),
        child: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRoutesConstants.gameChangeRoute);
                      },
                      child: SvgPicture.asset('assets/left_button_game.svg',
                          width: 69.12, height: 120)),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRoutesConstants.menuRoute);
                      },
                      child: SvgPicture.asset(
                          'assets/left_button_food_active.svg',
                          width: 69.12,
                          height: 120)),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRoutesConstants.movieChangeRoute);
                      },
                      child: SvgPicture.asset('assets/left_button_movie.svg',
                          width: 69.12, height: 120))
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRoutesConstants.ageEditRoute);
                      },
                      child: SvgPicture.asset('assets/settings.svg',
                          width: 90, height: 90)),
                  InkWell(
                      onTap: () {
                      },
                      child: SvgPicture.asset('assets/sound.svg',
                          width: 90, height: 90)),
                ],
              ),
            ),
            Positioned(
              left: 110,
              child: Text(
                'ДЕТСКОЕ',
                style: TextStyle(
                  fontFamily: 'InterExtraBold',
                  fontSize: 94,
                  color: HexColor('#F4E6C6'),
                ),
              ),
            ),
            Positioned(
                top: 110,
                left: 310,
                child: Text(
                  'МЕНЮ',
                  style: TextStyle(
                    fontFamily: 'InterExtraBold',
                    fontSize: 94,
                    color: HexColor('#F4E6C6'),
                  ),
                )),
            Positioned(
                top: 220,
                child: Container(
                  width: 1250,
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('items')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            // padding: EdgeInsets.symmetric(horizontal: 200),
                            // padding:
                            // const EdgeInsets.fromLTRB(150, 400, 100, 0),
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index % 2 == 0) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      .get('name'),
                                                  style: TextStyle(
                                                      fontSize: 42,
                                                      fontFamily:
                                                          "InterExtraBold",
                                                      color:
                                                          HexColor("#F4E6C6")),
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
                                                      fontSize: 28,
                                                      fontFamily:
                                                          "MontserratSemiBold",
                                                      color: Colors.white),
                                                ))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${snapshot.data!.docs[index].get('weight')} гр.",
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontFamily:
                                                          "MontserratSemiBold",
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "${snapshot.data!.docs[index].get('price')} руб.",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontFamily:
                                                          "MontserratExtraBold",
                                                      color:
                                                          HexColor("#F4E6C6")),
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
                              } else {
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data!.docs[index]
                                                      .get('name'),
                                                  style: TextStyle(
                                                      fontSize: 42,
                                                      fontFamily:
                                                          "InterExtraBold",
                                                      color:
                                                          HexColor("#F4E6C6")),
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
                                                      fontSize: 28,
                                                      fontFamily:
                                                          "MontserratSemiBold",
                                                      color: Colors.white),
                                                ))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${snapshot.data!.docs[index].get('weight')} гр.",
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontFamily:
                                                          "MontserratSemiBold",
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "${snapshot.data!.docs[index].get('price')} руб.",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontFamily:
                                                          "MontserratExtraBold",
                                                      color:
                                                          HexColor("#F4E6C6")),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            });
                      }),
                )),
          ],
        ),
      ),
    ));
  }
}
