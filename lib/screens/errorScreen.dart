import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ОШИБКА!',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontFamily: 'MontserratExtraBold'),
            ),
            const Text(
              'Данная страница не найдена:(',
              style: TextStyle(fontSize: 28, fontFamily: 'MontserratSemiBold'),
            ),
            const Text(
              'Но не расстраивайся. Нажми на кнопку и вернись на страницу входа.',
              style: TextStyle(fontSize: 28, fontFamily: 'MontserratSemiBold'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(300, 60)),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.white)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))),
              onPressed: () {
                GoRouter.of(context)
                    .pushNamed(MyAppRoutesConstants.homeRouteName);
              },
              child: const Text(
                'Главная страница',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
