import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionDoubleScreen extends StatefulWidget {
  const ActionDoubleScreen({super.key});

  @override
  State<ActionDoubleScreen> createState() => _ActionDoubleScreenState();
}

class _ActionDoubleScreenState extends State<ActionDoubleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back_main.jpg'), fit: BoxFit.cover)),
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
                                      'assets/left_button_food.svg',
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
                      Padding(
                        padding: const EdgeInsets.only(top: 280),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                      MyAppRoutesConstants.gameChangeRoute);
                                },
                                child: SvgPicture.asset(
                                  'assets/button_game.svg',
                                  width: 130,
                                  height: 80,
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    MyAppRoutesConstants.movieChangeRoute);
                              },
                              child: SvgPicture.asset(
                                'assets/button_movie.svg',
                                width: 130,
                                height: 80,
                              )),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .pushNamed(MyAppRoutesConstants.menuRoute);
                              },
                              child: SvgPicture.asset(
                                'assets/button_food.svg',
                                width: 130,
                                height: 80,
                              )),
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
                                        MyAppRoutesConstants.ageSetRoute);
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
            const SizedBox(
              height: 63,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    const Row(children: [
                      Image(
                        image: AssetImage('assets/cat_usual.png'),
                        width: 287.09,
                        height: 317,
                      ),
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
                                      'Давай сделаем что-то интересное! Нажми',
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: HexColor("#3E3A39"),
                                      fontFamily: 'Montserrat'),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: ' оранжевую кнопку',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                        color: HexColor("#FF8E1F"))),
                                TextSpan(
                                    text: ', чтобы поиграть в игры,',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 21,
                                        color: HexColor("#3E3A39"))),
                                TextSpan(
                                    text: ' розовую кнопку',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                        color: HexColor("#F11D81"))),
                                TextSpan(
                                    text:
                                        ', чтобы послушать увлекательную историю, или',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 21,
                                        color: HexColor("#3E3A39"))),
                                TextSpan(
                                    text: ' зеленую кнопку',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21,
                                        color: HexColor("#1CEA56"))),
                                TextSpan(
                                    text: ', чтобы выбрать вкусняшки из меню.',
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
