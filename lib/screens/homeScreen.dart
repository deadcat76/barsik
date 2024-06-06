import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back_home.jpg'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              top: 520,
              left: 200,
              child: ElevatedButton(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                      TextStyle(color: HexColor("#FFFFFF"))),
                  backgroundColor: MaterialStateProperty.all(
                      HexColor("#558384")),
                  padding: MaterialStateProperty.all(const EdgeInsets.only(
                      left: 100, top: 15, bottom: 15, right: 100)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
              onPressed: () {
                GoRouter.of(context)
                    .pushNamed(MyAppRoutesConstants.ageSetRoute);
              },
              child: Text(
                'Играть!',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: HexColor("#FFFFFF")),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
