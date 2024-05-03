import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/cupertino.dart';
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
                                        MyAppRoutesConstants.gameChangeRoute);
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
                                        MyAppRoutesConstants.movieChangeRoute);
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
                      Padding(
                        padding: const EdgeInsets.only(left: 110),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('ИГРЫ С БАРСИКОМ',
                                    style: TextStyle(
                                      fontFamily: 'InterExtraBold',
                                      fontSize: 80,
                                      fontWeight: FontWeight.w900,
                                      color: HexColor('#F4E6C6'),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                            MyAppRoutesConstants.actionDoubleRoute);
                                      },
                                      child: const Image(
                                        image: AssetImage('assets/game1.png'),
                                        width: 335,
                                        height: 193,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Прятки с Барсиком',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('#F4E6C7')),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                            MyAppRoutesConstants.actionDoubleRoute);
                                      },
                                      child: const Image(
                                        image: AssetImage('assets/game2.png'),
                                        width: 335,
                                        height: 193,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Считалка с Барсиком',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('#F4E6C7')),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        GoRouter.of(context).pushNamed(
                                            MyAppRoutesConstants.actionDoubleRoute);
                                      },
                                      child: const Image(
                                        image: AssetImage('assets/game3.png'),
                                        width: 335,
                                        height: 193,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Раскраска с Барсиком',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor('#F4E6C7')),
                                    ),
                                  ],
                                ),
                              ],
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
              height: 68,
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
