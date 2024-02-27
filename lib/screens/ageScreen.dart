import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final TextEditingController _nameTextController = TextEditingController();
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
                  'Имя',
                  style: TextStyle(fontSize: 35),
                ),
                const SizedBox(
                  height: 15,
                ),
                reusableTextField("name", false, _nameTextController),
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

