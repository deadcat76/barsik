import 'package:barsik/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class setNameScreen extends StatefulWidget {
  const setNameScreen({super.key});

  @override
  State<setNameScreen> createState() => _setNameScreenState();
}

class _setNameScreenState extends State<setNameScreen> {
  String? kidName;
  bool showSpinner = false;
  final TextEditingController _nameTextController = TextEditingController();
  final String assetName = 'assets/Barsik2.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back1.jpg'),
                fit: BoxFit.cover
            )
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Column(
                      children: <Widget>[
                      const Text('Имя', style: TextStyle(fontSize: 35, fontFamily: 'Rahovets', color: Colors.black87)),
                      reusableTextField('Введи своё имя', Icons.drive_file_rename_outline_rounded, false, _nameTextController),] ),
                Row(
                    children: <Widget>[
                    catWidget(assetName),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text('Барсик', style: TextStyle(fontSize: 35, fontFamily: 'Rahovets', color: Colors.orange),),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: const Text('Привет, друг! Давай знакомиться! Меня зовут Барсик, и я живу в (название)! А тебя как зовут? Попроси взрослого помочь тебе написать твоё имя!'),
                        )
                      ],
                    )
                    ],
                )
              ],
            ),
          ],
        )
      ),
    )
    ;
  }
}


