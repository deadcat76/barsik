import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:barsik/widgets/reusable_widget.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
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
            child: Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 55, right: 25),
                  child: settings(
                      context, 'assets/settings.svg', 'assets/sound.svg')),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ageButton(context, 'До 5 лет', HexColor("#1CEA56"),
                          MyAppRoutesConstants.actionRoute),
                      const SizedBox(
                        width: 20,
                      ),
                      ageButton(context, 'От 5 до 7 лет', HexColor("#FF8E1F"),
                          MyAppRoutesConstants.actionRoute)
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage('assets/cat_smile.png'),
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
                                  text:
                                      'Привет, друг! Я Барсик! Рад приветствовать тебя в нашем веселом мире развлечений! Скажи, пожалуйста, сколько тебе лет? Нажми',
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: HexColor("#3E3A39"),
                                      fontFamily: 'Montserrat'),
                                  children: <TextSpan>[
                                textSpan(' зеленую кнопку', FontWeight.bold,
                                    HexColor("#1CEA56")),
                                textSpan(', если тебе до 5 лет, или',
                                    FontWeight.normal, HexColor("#3E3A39")),
                                textSpan(' оранжевую кнопку', FontWeight.bold,
                                    HexColor("#FF8E1F")),
                                textSpan(', если тебе от 5 до 7 лет.',
                                    FontWeight.normal, HexColor("#3E3A39"))
                              ])))),
                ],
              ))
        ],
      ),
    );
  }
}
