// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_flags.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class GameFlags extends _GameFlags
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  GameFlags({
    bool isStarting = true,
    bool isLoggedIn = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<GameFlags>({
        'isStarting': true,
        'isLoggedIn': false,
      });
    }
    RealmObjectBase.set(this, 'isStarting', isStarting);
    RealmObjectBase.set(this, 'isLoggedIn', isLoggedIn);
  }

  GameFlags._();

  @override
  bool get isStarting => RealmObjectBase.get<bool>(this, 'isStarting') as bool;
  @override
  set isStarting(bool value) => RealmObjectBase.set(this, 'isStarting', value);

  @override
  bool get isLoggedIn => RealmObjectBase.get<bool>(this, 'isLoggedIn') as bool;
  @override
  set isLoggedIn(bool value) => RealmObjectBase.set(this, 'isLoggedIn', value);

  @override
  Stream<RealmObjectChanges<GameFlags>> get changes =>
      RealmObjectBase.getChanges<GameFlags>(this);

  @override
  Stream<RealmObjectChanges<GameFlags>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<GameFlags>(this, keyPaths);

  @override
  GameFlags freeze() => RealmObjectBase.freezeObject<GameFlags>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'isStarting': isStarting.toEJson(),
      'isLoggedIn': isLoggedIn.toEJson(),
    };
  }

  static EJsonValue _toEJson(GameFlags value) => value.toEJson();
  static GameFlags _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'isStarting': EJsonValue isStarting,
        'isLoggedIn': EJsonValue isLoggedIn,
      } =>
        GameFlags(
          isStarting: fromEJson(isStarting),
          isLoggedIn: fromEJson(isLoggedIn),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(GameFlags._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, GameFlags, 'GameFlags', [
      SchemaProperty('isStarting', RealmPropertyType.bool),
      SchemaProperty('isLoggedIn', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
