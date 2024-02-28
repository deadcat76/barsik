import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _nameTextController = TextEditingController();
  final String assetName = 'assets/Barsik2.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/back1.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:350,bottom:0,left:0,right:0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Имя',
                        style: TextStyle(fontSize: 35, fontFamily: 'Rahovets', color: HexColor("#3E3A39")),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 300,
                        child: reusableTextField('Введи своё имя', false, _nameTextController),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          GoRouter.of(context)
                              .pushNamed(MyAppRoutesConstants.ageSetRoute);
                        },
                        child: Text('ок', style: TextStyle(fontSize: 32, fontFamily: 'Rahovets', color: HexColor("#3E3A39")),),),

                    ],
                  ),
                ),),
              Row(
                children: [
                  Column(children: [catWidget(assetName)],),
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
                          Padding(padding: const EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 20),
                              child: Expanded(child: Container(
                                  height: 170,
                                  width: 950,
                                  padding: const EdgeInsets.all(30),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Text('Привет, друг! Давай знакомиться! Меня зовут Барсик, и я живу в (название)! А тебя как зовут? Попроси взрослого помочь тебе написать твоё имя!',
                                      textDirection: TextDirection.ltr, style: TextStyle(fontSize: 27, color: HexColor("#3E3A39"), fontFamily: 'Bainsley') )))
                            //Column(),
                          )],
                      )],
                  ),
                    ],
                  )

              ]),
          ),
    );
  }
}

