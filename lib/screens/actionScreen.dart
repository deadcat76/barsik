import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({super.key});

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back_main.jpg'), fit: BoxFit.cover)),
        child: Column(children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(top: 55, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(MyAppRoutesConstants.ageEditRoute);
                          },
                          child: const Image(
                            image: AssetImage('assets/left_button_game.png'),
                            width: 72,
                            height: 125,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(MyAppRoutesConstants.ageEditRoute);
                          },
                          child: const Image(
                            image: AssetImage('assets/left_button_food.png'),
                            width: 72,
                            height: 125,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(MyAppRoutesConstants.ageEditRoute);
                          },
                          child: const Image(
                            image: AssetImage('assets/left_button_movie.png'),
                            width: 72,
                            height: 125,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(MyAppRoutesConstants
                                    .actionRoute); //потом поменять ссылку
                              },
                              child: const Image(
                                image: AssetImage('assets/button_food.png'),
                                width: 135,
                                height: 80,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(MyAppRoutesConstants
                                    .actionRoute); //потом поменять ссылку
                              },
                              child: const Image(
                                image: AssetImage('assets/button_game.png'),
                                width: 135,
                                height: 80,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context).pushNamed(MyAppRoutesConstants
                                    .actionRoute); //потом поменять ссылку
                              },
                              child: const Image(
                                image: AssetImage('assets/button_movie.png'),
                                width: 135,
                                height: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(MyAppRoutesConstants.ageEditRoute);
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
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(MyAppRoutesConstants.ageSetRoute);
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
          ),
          const SizedBox(
            height: 103,
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
                      height: 322,
                    ),
                  ]),
                  Positioned(
                    top: 150,
                    left: 200,
                    child: Container(
                        height: 136,
                        width: 825,
                        padding: const EdgeInsets.only(left: 45, right: 45),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: RichText(
                            text: TextSpan(
                                text: 'Превосходно! Нажми',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: HexColor("#3E3A39"),
                                    fontFamily: 'Montserrat'),
                                children: <TextSpan>[
                              TextSpan(
                                  text: ' зеленую кнопку',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: HexColor("#1CEA56"))),
                              TextSpan(
                                  text:
                                      ', чтобы покушать и зарядиться энергией,',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 22,
                                      color: HexColor("#3E3A39"))),
                              TextSpan(
                                  text: ' оранжевую кнопку',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: HexColor("#FF8E1F"))),
                              TextSpan(
                                  text:
                                      ', чтобы окунуться в захватывающий мир развлечений, или',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 22,
                                      color: HexColor("#3E3A39"))),
                              TextSpan(
                                  text: ' розовую кнопку',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: HexColor("#F11D81"))),
                              TextSpan(
                                  text: ', чтобы я рассказал историю!',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 22,
                                      color: HexColor("#3E3A39"))),
                            ]))),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
