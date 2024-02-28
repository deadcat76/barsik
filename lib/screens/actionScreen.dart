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
  final TextEditingController _nameTextController = TextEditingController();
  final String assetName = 'assets/Barsik3.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back2.jpg'),
                fit: BoxFit.cover
            )
        ),
        child:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:350,bottom:0,left:0,right:0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (){
                          GoRouter.of(context)
                              .pushNamed(MyAppRoutesConstants.actionRoute);
                        },
                        child: Text('Давай кушать', style: TextStyle(fontSize: 32, fontFamily: 'Rahovets', color: HexColor("#3E3A39")),),),
                      ElevatedButton(
                        onPressed: (){
                          GoRouter.of(context)
                              .pushNamed(MyAppRoutesConstants.actionRoute);
                        },
                        child: Text('Давай играть', style: TextStyle(fontSize: 32, fontFamily: 'Rahovets', color: HexColor("#3E3A39")),),),
                      const SizedBox(
                        height: 165,
                      ),
                    ],
                  ),

                ),
              ),
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
                                  child: Text('Круто! Нажми зеленую кнопку, чтобы пообедать или желтую кнопку, чтобы поиграть!',
                                      textDirection: TextDirection.ltr, style: TextStyle(fontSize: 27, color: HexColor("#3E3A39"), fontFamily: 'Bainsley'))))

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