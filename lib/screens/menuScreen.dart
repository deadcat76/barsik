import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: HexColor("#558384"),
              child: Padding(
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
                                            MyAppRoutesConstants
                                                .gameChangeRoute);
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
                                          MyAppRoutesConstants
                                              .movieChangeRoute);
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
                          padding: const EdgeInsets.only(left: 110),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('ДЕТСКОЕ МЕНЮ',
                                      style: TextStyle(
                                        fontFamily: 'InterExtraBold',
                                        fontSize: 80,
                                        fontWeight: FontWeight.w900,
                                        color: HexColor('#F4E6C6'),
                                      )),
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
                                    child: SvgPicture.asset(
                                        'assets/settings.svg',
                                        width: 90,
                                        height: 90)),
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
            ),
          ],
        ),
      ),
    );
  }
}
