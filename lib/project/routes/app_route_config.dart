import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/screens/ageEditScreen.dart';
import 'package:barsik/screens/errorScreen.dart';
import 'package:barsik/screens/homeScreen.dart';
import 'package:barsik/screens/nameScreen.dart';
import 'package:barsik/screens/ageScreen.dart';
import 'package:barsik/screens/actionScreen.dart';
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
      GoRoute(
          name: MyAppRoutesConstants.ageEditRoute,
          path: '/age_edit',
          pageBuilder: (context, state) {
            return const MaterialPage(child: AgeEditScreen());
          }),
      GoRoute(
          name: MyAppRoutesConstants.actionRoute,
          path: '/action',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ActionScreen());
          }),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorScreen());
    }
  );
}