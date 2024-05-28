// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:riverpod/riverpod.dart';
import 'package:fractal_codex/database/game_flags.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

// part 'initializer.g.dart';

class Initializer {

  newGameInit() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? newGame = prefs.getBool('newGame');

    if (newGame == null) {
      gameFlagInit();
      prefs.setBool('newGame', true);
    }
  }

  void gameFlagInit() {
    var config = Configuration.local([GameFlags.schema]);
    var realm = Realm(config);

    realm.write(() {
      realm.add(GameFlags());
    });
  }
}

// @riverpod
// class Initializer extends _$Initializer {
//   @override
//   String 
// }