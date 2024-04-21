import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class GameChangeScreen extends StatefulWidget {
  const GameChangeScreen({super.key});

  @override
  State<GameChangeScreen> createState() => _GameChangeScreenState();
}

class _GameChangeScreenState extends State<GameChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#558384"),
        child: Column(
          children: <Widget>[
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
                                        MyAppRoutesConstants.ageEditRoute);
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/left_button_game_active.png'),
                                    width: 69.12,
                                    height: 120,
                                  ),
                                ),
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
                                        MyAppRoutesConstants.ageEditRoute);
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/left_button_food.png'),
                                    width: 69.12,
                                    height: 120,
                                  ),
                                ),
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
                                        MyAppRoutesConstants.ageEditRoute);
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                        'assets/left_button_movie.png'),
                                    width: 69.12,
                                    height: 120,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Text('ИГРЫ С БАРСИКОМ',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 80,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 280),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    MyAppRoutesConstants
                                        .actionRoute); //потом поменять ссылку
                              },
                              child: const Image(
                                image: AssetImage('assets/button_food.png'),
                                width: 130,
                                height: 80,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    MyAppRoutesConstants
                                        .actionRoute); //потом поменять ссылку
                              },
                              child: const Image(
                                image: AssetImage('assets/button_game.png'),
                                width: 130,
                                height: 80,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    MyAppRoutesConstants
                                        .actionRoute); //потом поменять ссылку
                              },
                              child: const Image(
                                image: AssetImage('assets/button_movie.png'),
                                width: 130,
                                height: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                child: const Image(
                                  image: AssetImage('assets/settings.png'),
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                      MyAppRoutesConstants.ageSetRoute);
                                },
                                child: const Image(
                                  image: AssetImage('assets/sound.png'),
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 63,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Image(
                            image: AssetImage('assets/cat_usual.png'),
                            width: 287.09,
                            height: 317,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 200, right: 90),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(184, 49)),
                                  backgroundColor: MaterialStateProperty.all(
                                      HexColor("#20BBDF")),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(color: Colors.white)),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(0)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          side: const BorderSide(
                                              color: Colors.white,
                                              width: 4.0)))),
                              onPressed: () {
                                GoRouter.of(context).pushNamed(
                                    MyAppRoutesConstants.actionDoubleRoute);
                              },
                              child: const Text(
                                'Назад',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                    Positioned(
                      top: 150,
                      left: 200,
                      child: Container(
                          height: 134,
                          width: 790,
                          padding: const EdgeInsets.only(left: 45, right: 45),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: RichText(
                              text: TextSpan(
                                  text:
                                  'Здорово, хочешь сыграть в игру? Нажми на одну из',
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: HexColor("#3E3A39"),
                                      fontFamily: 'Montserrat'),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' красных кнопок',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21,
                                            color: HexColor("#FF381E"))),
                                    TextSpan(
                                        text:
                                        ', и я расскажу тебе об этой захватывающей игре! Или, если хочешь заняться чем-нибудь другим, нажми',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 21,
                                            color: HexColor("#3E3A39"))),
                                    TextSpan(
                                        text: ' голубую кнопку',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21,
                                            color: HexColor("#20BBDF"))),
                                    TextSpan(
                                        text: '.',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 21,
                                            color: HexColor("#3E3A39"))),
                                  ]))),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
