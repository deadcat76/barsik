import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:barsik/widgets/reusable_widget.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({super.key});

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back_main.jpg'),
                    fit: BoxFit.cover)),
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
                                buttonInkWell(
                                    context,
                                    MyAppRoutesConstants.gameChangeRoute,
                                    'assets/left_button_game.svg',
                                    69.12,
                                    120),
                                const SizedBox(
                                  height: 20,
                                ),
                                buttonInkWell(
                                    context,
                                    MyAppRoutesConstants.menuRoute,
                                    'assets/left_button_food.svg',
                                    69.12,
                                    120),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 280),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                buttonInkWell(
                                    context,
                                    MyAppRoutesConstants.menuRoute,
                                    'assets/button_food.svg',
                                    130,
                                    80),
                                const SizedBox(
                                  width: 15,
                                ),
                                buttonInkWell(
                                    context,
                                    MyAppRoutesConstants.gameChangeRoute,
                                    'assets/button_game.svg',
                                    130,
                                    80),
                                const SizedBox(
                                  width: 15,
                                ),
                                buttonInkWell(
                                    context,
                                    MyAppRoutesConstants.movieChangeRoute,
                                    'assets/button_movie.svg',
                                    130,
                                    80),
                              ],
                            ),
                          ),
                          settings(context, 'assets/settings.svg',
                              'assets/sound.svg')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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
                                  text: 'Превосходно! Нажми',
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: HexColor("#3E3A39"),
                                    fontFamily: 'Montserrat',
                                  ),
                                  children: <TextSpan>[
                                textSpan(' зеленую кнопку', FontWeight.bold,
                                    HexColor("#1CEA56")),
                                textSpan(
                                    ', чтобы покушать и зарядиться энергией,',
                                    FontWeight.normal,
                                    HexColor("#3E3A39")),
                                textSpan(' оранжевую кнопку', FontWeight.bold,
                                    HexColor("#FF8E1F")),
                                textSpan(
                                    ', чтобы окунуться в захватывающий мир развлечений, или',
                                    FontWeight.normal,
                                    HexColor("#3E3A39")),
                                textSpan(' розовую кнопку', FontWeight.bold,
                                    HexColor("#F11D81")),
                                textSpan(', чтобы я рассказал историю!',
                                    FontWeight.normal, HexColor("#3E3A39"))
                              ])))),
                ],
              ))
        ],
      ),
    );
  }
}
