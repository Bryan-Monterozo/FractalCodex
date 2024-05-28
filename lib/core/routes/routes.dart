import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/routes/route_name.dart';
import 'package:fractal_codex/database/game_flags.dart';
import 'package:fractal_codex/modules/home/view/home_screen.dart';
import 'package:fractal_codex/modules/starting_page/view/screens/loading_screen.dart';
import 'package:fractal_codex/modules/starting_page/view/screens/race_select_screen.dart';
import 'package:fractal_codex/modules/starting_page/view/screens/welcome_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:realm/realm.dart';

final goRouterProvider = Provider.autoDispose((ref) {
  ref.keepAlive();
  var config = Configuration.local([GameFlags.schema]);
  var realm = Realm(config);
  var flags = realm.all<GameFlags>();
  bool isStarting = flags[0].isStarting;
  print(isStarting);

  return GoRouter(
    initialLocation: '/loading',
    routes: [
      GoRoute(
        path: '/loading',
        name: loading,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const LoadingScreen(),
        ),
      ),
      GoRoute(
        path: '/',
        name: root,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
        redirect: (context, state) {
          if (isStarting == true) {
            return '/welcome';
          }
          return '/home';
        },
      ),
      GoRoute(
        path: '/home',
        name: home,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/welcome',
        name: welcome,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const WelcomeScreen(),
        ),
        redirect: (context, state) {
          if (isStarting == false) {
            return '/home';
          }
          return '/welcome';
        },
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
      ),
      GoRoute(
        path: '/welcome/race',
        name: race,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const RaceSelectScreen(),
        ),
      )
    ],
  );
});
