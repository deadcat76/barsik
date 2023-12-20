import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Барсик',
                style: TextStyle(fontSize: 70),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: (){
                  GoRouter.of(context)
                      .pushNamed(MyAppRoutesConstants.setNameRouteName);
                },
                child: const Text('Давай играть!', style: TextStyle(fontSize: 35, fontFamily: 'Rahovets'),),)
          ],
        ),
      ),
    )
    );
  }
}
