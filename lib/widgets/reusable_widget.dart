import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:hexcolor/hexcolor.dart';

//Метод для кнопок, которые есть на страницах указания возраста
ElevatedButton ageButton(
    BuildContext context, String text, Color color, String route) {
  return ElevatedButton(
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(const Size(320, 80)),
      backgroundColor: MaterialStateProperty.all(color),
      textStyle: MaterialStateProperty.all(const TextStyle(
        color: Colors.white,
      )),
      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.white,
          width: 5.0,
        ),
      )),
    ),
    onPressed: () {
      GoRouter.of(context).pushNamed(route);
    },
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 35,
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

//Метод для ссылочных изображений SVG
InkWell buttonInkWell(BuildContext context, String route, String image,
    double width, double height) {
  return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(route);
      },
      child: SvgPicture.asset(image, width: width, height: height));
}

//Метод для ссылочных изображений PNG и JPG
InkWell imageInkWell(BuildContext context, String route, AssetImage image,
    double width, double height) {
  return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(route);
      },
      child: Image(
        image: image,
        width: width,
        height: height,
      ));
}

//Метод для кнопки "назад", стиль одинаковый
ElevatedButton backButton(BuildContext context) {
  return ElevatedButton(
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(184, 49)),
        backgroundColor: MaterialStateProperty.all(HexColor("#20BBDF")),
        textStyle:
            MaterialStateProperty.all(const TextStyle(color: Colors.white)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.white, width: 4.0)))),
    onPressed: () {
      GoRouter.of(context).pushNamed(MyAppRoutesConstants.actionDoubleRoute);
    },
    child: const Text(
      'Назад',
      style: TextStyle(
          fontSize: 25,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white),
    ),
  );
}

//Метод для текста реплик Барсика
TextSpan textSpan(String text, FontWeight fontWeight, Color color) {
  return TextSpan(
      text: text,
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 21,
          fontWeight: fontWeight,
          color: color));
}

//Виджет с настройками, для оптимизации используется виджет buttonInkWell
Align settings(BuildContext context, String imageSettings, String imageSound) {
  return Align(
    alignment: Alignment.topRight,
    child: Column(
      children: [
        buttonInkWell(
            context, MyAppRoutesConstants.ageEditRoute, imageSettings, 90, 90),
        buttonInkWell(
            context, MyAppRoutesConstants.ageSetRoute, imageSound, 90, 90)
      ],
    ),
  );
}
