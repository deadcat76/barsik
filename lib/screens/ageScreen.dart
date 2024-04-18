import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final String assetName = 'assets/Barsik3.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back_main.jpg'), fit: BoxFit.cover)),
        child: Column(children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 350, bottom: 0, left: 0, right: 0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(330, 80)),
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("#1CEA56")),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(color: Colors.white)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Colors.white, width: 5.0)))),
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
                    width: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(330, 80)),
                        backgroundColor:
                            MaterialStateProperty.all(HexColor("#FF8E1F")),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(color: Colors.white)),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(color: Colors.white, width: 5.0)))),
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
            height: 85,
          ),
          Row(
            children: [
              Column(
                children: [catWidget(assetName)],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        Text(
                          'Барсик',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Rahovets',
                              color: HexColor("#FFB271")),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 0, bottom: 0, right: 20),
                          child: Expanded(
                              child: Container(
                                  height: 138,
                                  width: 835,
                                  padding: const EdgeInsets.all(30),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                      'Привет, друг! Я Барсик! Рад приветствовать тебя в нашем веселом мире развлечений! Скажи, пожалуйста, сколько тебе лет? Нажми зелёную кнопку, если тебе до 5 лет, или оранжевую кнопку, если тебе от 5 до 7 лет.',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          fontSize: 27,
                                          color: HexColor("#3E3A39"),
                                          fontFamily: 'Montserrat'))))
                          //Column(),
                          )
                    ],
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
