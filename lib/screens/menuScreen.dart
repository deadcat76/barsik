import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:barsik/widgets/reusable_widget.dart';

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
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 55, right: 25),
            width: double.infinity,
            height: 6690,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/back_menu.jpg'))),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Column(
                    children: [
                      buttonInkWell(
                          context,
                          MyAppRoutesConstants.gameChangeRoute,
                          'assets/left_button_game.svg',
                          69.12,
                          120),
                      const SizedBox(
                        height: 20,
                      ),
                      buttonInkWell(context, MyAppRoutesConstants.menuRoute,
                          'assets/left_button_food_active.svg', 69.12, 120),
                      const SizedBox(
                        height: 20,
                      ),
                      buttonInkWell(
                          context,
                          MyAppRoutesConstants.movieChangeRoute,
                          'assets/left_button_movie.svg',
                          69.12,
                          120)
                    ],
                  ),
                ),
                settings(context, 'assets/settings.svg', 'assets/sound.svg'),
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
                    top: 150,
                    child: Container(
                      width: 1180,
                      padding: const EdgeInsets.only(left: 80),
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
                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Text("No data available");
                            }
                            List<DocumentSnapshot> lastThreeItem =
                                snapshot.data!.docs.length > 3
                                    ? snapshot.data!.docs
                                        .sublist(snapshot.data!.docs.length - 3)
                                    : snapshot.data!.docs;
                            return Column(
                              children: [
                                ListView.builder(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 9,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index % 2 == 0) {
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get('name'),
                                                              style: TextStyle(
                                                                  fontSize: 42,
                                                                  fontFamily:
                                                                      "InterExtraBold",
                                                                  color: HexColor(
                                                                      "#F4E6C6")),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Flexible(
                                                                child: Text(
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get(
                                                                      'description'),
                                                              style: const TextStyle(
                                                                  fontSize: 28,
                                                                  fontFamily:
                                                                      "MontserratSemiBold",
                                                                  color: Colors
                                                                      .white),
                                                            ))
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 30,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "${snapshot.data!.docs[index].get('weight')} гр",
                                                              style: const TextStyle(
                                                                  fontSize: 25,
                                                                  fontFamily:
                                                                      "MontserratSemiBold",
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              "${snapshot.data!.docs[index].get('price')} Р",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  fontFamily:
                                                                      "MontserratExtraBold",
                                                                  color: HexColor(
                                                                      "#F4E6C6")),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Image.network(
                                                  snapshot.data!.docs[index]
                                                      .get('url'),
                                                  fit: BoxFit.cover,
                                                )),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            )
                                          ],
                                        );
                                      } else {
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Image.network(
                                                  snapshot.data!.docs[index]
                                                      .get('url'),
                                                  fit: BoxFit.cover,
                                                )),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get('name'),
                                                              style: TextStyle(
                                                                  fontSize: 42,
                                                                  fontFamily:
                                                                      "InterExtraBold",
                                                                  color: HexColor(
                                                                      "#F4E6C6")),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Flexible(
                                                                child: Text(
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .get(
                                                                      'description'),
                                                              style: const TextStyle(
                                                                  fontSize: 28,
                                                                  fontFamily:
                                                                      "MontserratSemiBold",
                                                                  color: Colors
                                                                      .white),
                                                            ))
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "${snapshot.data!.docs[index].get('weight')} гр",
                                                              style: const TextStyle(
                                                                  fontSize: 25,
                                                                  fontFamily:
                                                                      "MontserratSemiBold",
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            const SizedBox(
                                                              width: 20,
                                                            ),
                                                            Text(
                                                              "${snapshot.data!.docs[index].get('price')} Р",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  fontFamily:
                                                                      "MontserratExtraBold",
                                                                  color: HexColor(
                                                                      "#F4E6C6")),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            )
                                          ],
                                        );
                                      }
                                    }),
                                SizedBox(
                                  height: 380,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: lastThreeItem.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return (SizedBox(
                                          width: 360,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                lastThreeItem[index]
                                                    .get('name'),
                                                style: TextStyle(
                                                    fontSize: 42,
                                                    fontFamily:
                                                        "InterExtraBold",
                                                    color: HexColor("#F4E6C6")),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  lastThreeItem[index]
                                                      .get('description'),
                                                  style: const TextStyle(
                                                      fontSize: 28,
                                                      fontFamily:
                                                          "MontserratSemiBold",
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Row(children: [
                                                Text(
                                                  "${lastThreeItem[index].get('weight')} мл",
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
                                                  "${lastThreeItem[index].get('price')} Р",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontFamily:
                                                          "MontserratExtraBold",
                                                      color:
                                                          HexColor("#F4E6C6")),
                                                ),
                                              ])
                                            ],
                                          ),
                                        ));
                                      }),
                                )
                              ],
                            );
                          }),
                    )),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Stack(
              children: [
                const Image(
                  image: AssetImage('assets/cat_usual.png'),
                  width: 287.09,
                  height: 317,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 200),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 134,
                        width: 790,
                        padding: const EdgeInsets.only(left: 45, right: 45),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Здесь я собрал для тебя все мои самые любимые блюда, думаю, они тебе понравятся тоже! Выбери любое блюдо и закажи его у официанта.',
                          style: TextStyle(
                              fontSize: 21,
                              fontFamily: 'Montserrat',
                              color: HexColor("#3E3A39")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: backButton(context),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ],
    ));
  }
}
