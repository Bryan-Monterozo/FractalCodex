import 'package:flutter/material.dart';
import 'package:fractal_codex/core/initializer.dart';
import 'package:fractal_codex/core/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'starting_page_controller.g.dart';

@riverpod
class LoadingPage extends _$LoadingPage {
  @override
  double build() {
    initialize();
    return 0.0;
  }

  final Initializer initializer = Initializer();

  void initialize() async {
    await initializer.newGameInit();
    state = 0.10;
  }

  void debugButton() {
    state = state + 0.10;
    loadingBarDone();
  }

  void loadingBarDone() {
    if (state >= 1.0) {
      ref.read(goRouterProvider).go('/welcome');
    }
  }
}

@riverpod
class WelcomePage extends _$WelcomePage {
  @override
  int build() {
    return 0;
  }

  raceSelect() {
    ref.read(goRouterProvider).push('/welcome/race');
  }
}