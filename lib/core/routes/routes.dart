import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/routes/route_name.dart';
import 'package:fractal_codex/modules/home/view/home_screen.dart';
import 'package:fractal_codex/modules/starting_page/view/start_screen.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider((ref) {

  bool flagTest = false;
  
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: root,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomeScreen(),
        ),
        redirect: (context, state) {
          if (flagTest == true) {
            return '/start';
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
        path: '/start',
        name: start,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const StartScreen(),
        ),
      )
    ],
  );
});
