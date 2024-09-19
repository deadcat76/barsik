import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:barsik/widgets/reusable_widget.dart';

class MovieChangeScreen extends StatefulWidget {
  const MovieChangeScreen({super.key});

  @override
  State<MovieChangeScreen> createState() => _MovieChangeScreenState();
}

class _MovieChangeScreenState extends State<MovieChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              color: HexColor("#558384"),
              child: Padding(
                padding: const EdgeInsets.only(top: 55, right: 25),
                child: Stack(
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
                          buttonInkWell(context, MyAppRoutesConstants.menuRoute,
                              'assets/left_button_food.svg', 69.12, 120),
                          const SizedBox(
                            height: 20,
                          ),
                          buttonInkWell(
                              context,
                              MyAppRoutesConstants.movieChangeRoute,
                              'assets/left_button_movie_active.svg',
                              69.12,
                              120)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('СКАЗКИ С БАРСИКОМ',
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  imageInkWell(
                                      context,
                                      MyAppRoutesConstants.actionDoubleRoute,
                                      const AssetImage('assets/movie1.png'),
                                      490,
                                      272),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Появление Барсика в ресторане',
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
                    settings(
                        context, 'assets/settings.svg', 'assets/sound.svg'),
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
                                padding:
                                    const EdgeInsets.only(top: 150, left: 200),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: 134,
                                        width: 790,
                                        padding: const EdgeInsets.only(
                                            left: 45, right: 45),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: RichText(
                                            text: TextSpan(
                                                text:
                                                    'Хочешь послушать интересную историю? Нажми на картинку, и я расскажу тебе о том, как я оказался в этом ресторане! Или, если хочешь заняться чем-нибудь другим, нажми',
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    color: HexColor("#3E3A39"),
                                                    fontFamily: 'Montserrat'),
                                                children: <TextSpan>[
                                              textSpan(
                                                  ' голубую кнопку',
                                                  FontWeight.bold,
                                                  HexColor("#20BBDF")),
                                              textSpan('.', FontWeight.normal,
                                                  HexColor("#3E3A39"))
                                            ]))),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: backButton(context),
                                    )
                                  ],
                                ))
                          ],
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
