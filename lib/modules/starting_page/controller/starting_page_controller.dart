import 'package:fractal_codex/core/initializer.dart';
import 'package:fractal_codex/core/routes/routes.dart';
import 'package:fractal_codex/database/game_flags.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'starting_page_controller.g.dart';

@riverpod
class LoadingProgress extends _$LoadingProgress {
  int loadVal = 0;
  double loadValDouble = 0.0;

  @override
  (double, int) build() {
    initialize();
    return (loadValDouble, loadVal);
  }

  final Initializer initializer = Initializer();

  void initialize() async {
    await initializer.newGameInit();
    state = (0.10, 10);
  }

  void debugButton() {
    state = (state.$1 + 0.10, state.$2 + 10);
    loadingBarDone();
  }

  void loadingBarDone() {
    if (state.$1 >= 1.0) {
      var config = Configuration.local([GameFlags.schema]);
      var realm = Realm(config);
      var flags = realm.all<GameFlags>();
      bool isStarting = flags[0].isStarting;

      if (isStarting == true) {
        ref.read(goRouterProvider).goNamed('welcome');
      } else {
        ref.read(goRouterProvider).goNamed('home');
      }
      realm.close();
    }
  }
}

@riverpod
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
