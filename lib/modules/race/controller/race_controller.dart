import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'race_controller.g.dart';

@riverpod
class RacePicker extends _$RacePicker {
  int picker = 0;

  @override
  String build() {
    return 'Human';
  }

  void changeRace(String race) {
    state = race;
  }

  void goRight() {
    if (picker < 3) {
      picker = picker + 1;
    } else {
      picker = 0;
    }
    racePicked(picker);
  }

  void goLeft() {
    if (picker > 0) {
      picker = picker - 1;
    } else {
      picker = 3;
    }
    racePicked(picker);
  }

  void racePicked(int index) {
    switch (index) {
      case 0:
        changeRace('Human');
        break;
      case 1:
        changeRace('Elf');
        break;
      case 2:
        changeRace('Dwarf');
        break;
      case 3:
        changeRace('Orc');
        break;
    }
  }
}
