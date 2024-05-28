import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/colors/colors.dart';
import 'package:fractal_codex/core/initializer.dart';
import 'package:fractal_codex/core/routes/routes.dart';
import 'package:fractal_codex/modules/home/view/home_screen.dart';

void main() {
  final container = ProviderContainer();
  Initializer().newGameInit();
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    final gameColors = GameColors();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      // routeInformationParser: router.routeInformationParser,
      // routeInformationProvider: router.routeInformationProvider,
      // routerDelegate: router.routerDelegate,
      title: 'Fractal CODEX',
      theme: ThemeData(
        // primaryColor: Colors.black,
        scaffoldBackgroundColor: gameColors.black,
        useMaterial3: true,
      ),
    );
  }
}
