import 'package:barsik/project/routes/app_route_constants.dart';
import 'package:barsik/screens/actionDoubleScreen.dart';
import 'package:barsik/screens/ageEditScreen.dart';
import 'package:barsik/screens/errorScreen.dart';
import 'package:barsik/screens/gameChangeScreen.dart';
import 'package:barsik/screens/homeScreen.dart';
import 'package:barsik/screens/menuScreen.dart';
import 'package:barsik/screens/movieChangeScreen.dart';
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
          pageBuilder: (context, state) {
            return const MaterialPage(child: Home());
          }),
      GoRoute(
        name: MyAppRoutesConstants.ageSetRoute,
        path: '/age_set',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 500),
            fullscreenDialog: true,
            key: state.pageKey,
            child: const AgeScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
          name: MyAppRoutesConstants.ageEditRoute,
          path: '/age_edit',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              fullscreenDialog: true,
              key: state.pageKey,
              child: const AgeEditScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          name: MyAppRoutesConstants.actionRoute,
          path: '/action',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              fullscreenDialog: true,
              key: state.pageKey,
              child: const ActionScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          name: MyAppRoutesConstants.actionDoubleRoute,
          path: '/action_double',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              fullscreenDialog: true,
              key: state.pageKey,
              child: const ActionDoubleScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          name: MyAppRoutesConstants.gameChangeRoute,
          path: '/game_change',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              fullscreenDialog: true,
              key: state.pageKey,
              child: const GameChangeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          name: MyAppRoutesConstants.movieChangeRoute,
          path: '/movie_change',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              fullscreenDialog: true,
              key: state.pageKey,
              child: const MovieChangeScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          name: MyAppRoutesConstants.menuRoute,
          path: '/menu_get',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 500),
              fullscreenDialog: true,
              key: state.pageKey,
              child: const MenuScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                  child: child,
                );
              },
            );
          }),
    ],
    errorPageBuilder: (context, state) {
      return CustomTransitionPage(
        transitionDuration: const Duration(milliseconds: 500),
        fullscreenDialog: true,
        key: state.pageKey,
        child: const ErrorScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    }
  );

}

