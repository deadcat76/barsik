import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({super.key});

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  final String assetName = 'assets/Barsik3.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back2.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 350, bottom: 0, left: 0, right: 0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize:
                          MaterialStateProperty.all(const Size(350, 75)),
                          backgroundColor:
                          MaterialStateProperty.all(HexColor("#45BEA1")),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(color: HexColor("#3E3A39"))),
                          padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                      onPressed: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRoutesConstants.actionRoute);
                      },
                      child: const Text('Давай кушать', style: TextStyle(
                          fontSize: 28, fontFamily: 'Rahovets', color: Colors.white),),),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize:
                          MaterialStateProperty.all(const Size(350, 75)),
                          backgroundColor:
                          MaterialStateProperty.all(HexColor("#DFA81C")),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(color: HexColor("#3E3A39"))),
                          padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                      onPressed: () {
                        GoRouter.of(context)
                            .pushNamed(MyAppRoutesConstants.actionRoute);
                      },
                      child: const Text('Давай играть', style: TextStyle(
                          fontSize: 28, fontFamily: 'Rahovets', color: Colors.white),),),
                    const SizedBox(
                      height: 150,
                    ),
                  ],
                ),

              ),
            ),
            Row(
                children: [
                Column(children: [catWidget(assetName)
          ],),
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
                  Padding(padding: const EdgeInsets.only(
                      top: 0, left: 0, bottom: 0, right: 20),
                    child: Expanded(child: Container(
                        height: 170,
                        width: 950,
                        padding: const EdgeInsets.all(30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: RichText(
                          text: TextSpan(
                              text: 'Круто! Нажми',
                              style: TextStyle(fontFamily: 'Bainsley',
                                  fontSize: 27,
                                  color: HexColor("#3E3A39")),
                              children: <TextSpan>[
                                TextSpan(text: ' зеленую кнопку',
                                    style: TextStyle(fontFamily: 'Bainsley',
                                        fontSize: 27,
                                        color: HexColor("#45BEA1"))),
                                TextSpan(text: ', чтобы пообедать или',
                                    style: TextStyle(fontFamily: 'Bainsley',
                                        fontSize: 27,
                                        color: HexColor("#3E3A39"))),
                                TextSpan(text: ' желтую кнопку',
                                    style: TextStyle(fontFamily: 'Bainsley',
                                        fontSize: 27,
                                        color: HexColor("#DFA81C"))),
                                TextSpan(text: ', чтобы поиграть!',
                                    style: TextStyle(fontFamily: 'Bainsley',
                                        fontSize: 27,
                                        color: HexColor("#3E3A39")))
                              ]
                          ),
                        )
                      //Column(),
                    )))],
                    )],
                  ),
                ],
              )

            ]),
      ),
    );
  }

}