import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/screens/errorScreen.dart';
import 'package:barsik/screens/homeScreen.dart';
import 'package:barsik/screens/nameScreen.dart';
import 'package:barsik/screens/ageScreen.dart';
import 'package:barsik/screens/setNameScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter{
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
      name: MyAppRoutesConstants.homeRouteName,
      path: '/',
      pageBuilder: (context,state) {
        return const MaterialPage(child: Home()); //страница по умолчанию
      }),
      GoRoute(
        name: MyAppRoutesConstants.nameSetRoute,
        path: '/name_set',
        pageBuilder: (context, state) {
          return const MaterialPage(child: NameScreen());
        }),
      GoRoute(
          name: MyAppRoutesConstants.ageSetRoute,
          path: '/age_set',
          pageBuilder: (context, state) {
            return const MaterialPage(child: AgeScreen());
          }),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorScreen());
    }
  );
}