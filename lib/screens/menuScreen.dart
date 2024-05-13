import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            const Image(
              image: AssetImage('assets/back_menu.jpg'),
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.only(top: 40, left: 110),
              child: Text('ДЕТСКОЕ',
                style: TextStyle(
                  fontFamily: 'InterExtraBold',
                  fontSize: 94,
                  color: HexColor('#F4E6C6'),
                ), ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 145, left: 310),
              child: Text('МЕНЮ',
                style: TextStyle(
                  fontFamily: 'InterExtraBold',
                  fontSize: 94,
                  color: HexColor('#F4E6C6'),
                ), ),
            ),
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
                      GridView.count(
                        padding: const EdgeInsets.only(
                            left: 100, right: 100, top: 180),
                        crossAxisCount: 2,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 1.2 / 1,
                        mainAxisSpacing: 80,
                        children: List.generate(
                            18,
                            (index) => SizedBox(
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Text(
                                        'Это $index карточка',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
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
          ],
        ),
      ),
    );
  }
}
