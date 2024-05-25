import 'package:realm/realm.dart';

part 'game_flags.realm.dart';

@RealmModel()
class _GameFlags {
  bool isStarting = true;
  bool isLoggedIn = false;
}
