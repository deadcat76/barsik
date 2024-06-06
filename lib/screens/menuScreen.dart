import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import '../model/item.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ScrollController _scrollControllerList = ScrollController();
  final ScrollController _scrollControllerBackground = ScrollController();

  @override
  void initState() {
    _scrollControllerList.addListener(
      () {
        _scrollControllerBackground.jumpTo(_scrollControllerList.offset);
      },
    );
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized(); //Инициализация базы данных
    await Firebase.initializeApp(); //Подключение к базе данных
  }

  Future<List<Item>> getItems() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('items').get();
    return snapshot.docs
        .map((doc) => Item.fromMap(doc.data as Map<String, dynamic>))
        .toList();
  }

  @override
  void dispose() {
    _scrollControllerList.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoGlowScrollBehavior(),
          child: SingleChildScrollView(
            controller: _scrollControllerBackground,
            child: Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: 6690,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/back_menu.jpg')))),
                Positioned(
                  top: 30,
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                                MyAppRoutesConstants.gameChangeRoute);
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
                            GoRouter.of(context).pushNamed(
                                MyAppRoutesConstants.movieChangeRoute);
                          },
                          child: SvgPicture.asset(
                              'assets/left_button_movie.svg',
                              width: 69.12,
                              height: 120))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 31, right: 25),
                  child: Align(
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
                              GoRouter.of(context).pushNamed(
                                  MyAppRoutesConstants.menuItemRoute);
                            },
                            child: SvgPicture.asset('assets/sound.svg',
                                width: 90, height: 90)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30, left: 110),
                          child: Text(
                            'ДЕТСКОЕ',
                            style: TextStyle(
                              fontFamily: 'InterExtraBold',
                              fontSize: 94,
                              color: HexColor('#F4E6C6'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 310),
                          child: Text(
                            'МЕНЮ',
                            style: TextStyle(
                              fontFamily: 'InterExtraBold',
                              fontSize: 94,
                              color: HexColor('#F4E6C6'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 1265.5,
                        height: 4000,
                        child: ScrollConfiguration(
                          behavior: NoGlowScrollBehavior(),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        150, 400, 100, 0),
                                    itemCount: snapshot.data?.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index % 2 == 0) {
                                        return Row(
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
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get('name'),
                                                          style: TextStyle(
                                                              fontSize: 45,
                                                              color: HexColor(
                                                                  "#F4E6C6")),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                            child: Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  'description'),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 30,
                                                                  color: Colors
                                                                      .white),
                                                        ))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${snapshot.data!.docs[index].get('weight')} гр.",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 25,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          "${snapshot.data!.docs[index].get('price')} руб.",
                                                          style: TextStyle(
                                                              fontSize: 30,
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
                                        );
                                      } else {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get('name'),
                                                          style: TextStyle(
                                                              fontSize: 45,
                                                              color: HexColor(
                                                                  "#F4E6C6")),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                            child: Text(
                                                          snapshot
                                                              .data!.docs[index]
                                                              .get(
                                                                  'description'),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 30,
                                                                  color: Colors
                                                                      .white),
                                                        ))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${snapshot.data!.docs[index].get('weight')} гр.",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 25,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        const SizedBox(
                                                          width: 20,
                                                        ),
                                                        Text(
                                                          "${snapshot.data!.docs[index].get('price')} руб.",
                                                          style: TextStyle(
                                                              fontSize: 30,
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
                                        );
                                      }
                                    });
                              }),
                        ))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
