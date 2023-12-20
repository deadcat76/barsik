import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/screens/errorScreen.dart';
import 'package:barsik/screens/homeScreen.dart';
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
        return const MaterialPage(child: Home());
      }),
      GoRoute(
        name: MyAppRoutesConstants.setNameRouteName,
        path: '/set_name',
        pageBuilder: (context, state) {
          return const MaterialPage(child: setNameScreen());
        }
      )
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorScreen());
    }
  );
}