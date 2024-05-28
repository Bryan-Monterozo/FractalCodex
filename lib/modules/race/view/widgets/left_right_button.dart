import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/colors/colors.dart';
import 'package:fractal_codex/modules/race/controller/race_controller.dart';

class LeftRightButton extends ConsumerWidget {
  const LeftRightButton(this.direction, {super.key});

  final String direction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double textScaler = MediaQuery.of(context).textScaler.scale(1);
    Size scaler = MediaQuery.of(context).size;

    return Container(
        child: Stack(alignment: Alignment.center, children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: scaler.height * 0.1,
              width: scaler.width * 0.1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: GameColors().yellow,
              ),
            ),
          ),
          Align(
            alignment: Alignment(textScaler * -0.01, 1),
            child: Icon(
              (direction == 'left')
                  ? CupertinoIcons.left_chevron
                  : CupertinoIcons.right_chevron,
              color: GameColors().darkYellow,
              size: textScaler * 32,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (direction == 'left') {
                    ref.read(racePickerProvider.notifier).goLeft();
                  } else {
                    ref.read(racePickerProvider.notifier).goRight();
                  }
                },
                child: Ink(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: scaler.height * 0.1,
                  width: scaler.width * 0.1,
                ),
              ),
            ),
          ),
        ]));
  }
}
