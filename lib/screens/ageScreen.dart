import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .pushNamed(MyAppRoutesConstants.ageEditRoute);
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
                          GoRouter.of(context)
                              .pushNamed(MyAppRoutesConstants.ageSetRoute);
                        },
                        child: SvgPicture.asset('assets/sound.svg',
                            width: 90, height: 90)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(320, 80)),
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("#1CEA56")),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(color: Colors.white)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                color: Colors.white, width: 5.0)))),
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(MyAppRoutesConstants.actionRoute);
                    },
                    child: const Text(
                      'До 5 лет',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(320, 80)),
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("#FF8E1F")),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(color: Colors.white)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                color: Colors.white, width: 5.0)))),
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(MyAppRoutesConstants.actionRoute);
                    },
                    child: const Text(
                      'От 5 до 7 лет',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 108,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const Row(children: [
                    Image(
                      image: AssetImage('assets/cat_smile.png'),
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
                                    'Привет, друг! Я Барсик! Рад приветствовать тебя в нашем веселом мире развлечений! Скажи, пожалуйста, сколько тебе лет? Нажми',
                                style: TextStyle(
                                    fontSize: 21,
                                    color: HexColor("#3E3A39"),
                                    fontFamily: 'Montserrat'),
                                children: <TextSpan>[
                              TextSpan(
                                  text: ' зеленую кнопку',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                      color: HexColor("#1CEA56"))),
                              TextSpan(
                                  text: ', если тебе до 5 лет, или',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 21,
                                      color: HexColor("#3E3A39"))),
                              TextSpan(
                                  text: ' оранжевую кнопку',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                      color: HexColor("#FF8E1F"))),
                              TextSpan(
                                  text: ', если тебе от 5 до 7 лет.',
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
        ]),
      ),
    );
  }
}
