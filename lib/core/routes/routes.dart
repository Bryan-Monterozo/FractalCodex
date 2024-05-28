import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/routes/route_name.dart';
import 'package:fractal_codex/modules/home/view/home_screen.dart';
import 'package:fractal_codex/modules/starting_page/view/screens/loading_screen.dart';
import 'package:fractal_codex/modules/race/view/screens/race_select_screen.dart';
import 'package:fractal_codex/modules/starting_page/view/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider.autoDispose((ref) {
  ref.keepAlive();

  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: root,
          pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const LoadingScreen(),
              ),
          routes: [
            GoRoute(
                path: 'welcome',
                name: welcome,
                pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: const WelcomeScreen(),
                    ),
                // redirect: (context, state) {
                //   if (isStarting == false) {
                //     return '/home';
                //   } else {
                //     return '/welcome';
                //   }
                // },
                routes: [
                  GoRoute(
                    path: 'race',
                    name: race,
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: const RaceSelectScreen(),
                    ),
                  )
                ]),
            GoRoute(
              path: 'home',
              name: home,
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const HomeScreen(),
              ),
            ),
          ]),
      // GoRoute(
      //   path: '/welcome',
      //   name: welcome,
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: state.pageKey,
      //     child: const WelcomeScreen(),
      //   ),
      //   redirect: (context, state) {
      //     if (isStarting == false) {
      //       return '/home';
      //     }
      //     return '/welcome';
      //   },
      // routes: [
      //   GoRoute(
      //     path: 'race',
      //     name: race,
      //     pageBuilder: (context, state) => MaterialPage<void>(
      //       key: state.pageKey,
      //       child: const RaceSelectScreen(),
      //     ),
      //   ),
      // ],
      // ),
      // GoRoute(
      //   path: '/welcome/race',
      //   name: race,
      //   pageBuilder: (context, state) => MaterialPage<void>(
      //     key: state.pageKey,
      //     child: const RaceSelectScreen(),
      //   ),
      // )
    ],
  );
});
