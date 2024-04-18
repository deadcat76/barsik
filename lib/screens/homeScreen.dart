import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back_home.png') , fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 270,
              ),
              ElevatedButton(
                style: ButtonStyle (
                    textStyle: MaterialStateProperty.all(
                        TextStyle(color: HexColor("#47BFE2"))), // не видит
                    padding:
                    MaterialStateProperty.all(const EdgeInsets.only(left: 13, top: 13, bottom: 13, right: 20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
                onPressed: (){
                  GoRouter.of(context)
                      .pushNamed(MyAppRoutesConstants.ageSetRoute);
                },
                child: Text('ДАВАЙ ИГРАТЬ!', style: TextStyle(fontSize: 35, fontFamily: 'Rahovets', color: HexColor("#47BFE2")),),)
          ],
        ),
      ),
    )
    );
  }
}
