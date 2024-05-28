import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/colors/colors.dart';
import 'package:fractal_codex/core/routes/routes.dart';
import 'package:fractal_codex/modules/race/controller/race_controller.dart';
import 'package:fractal_codex/modules/race/view/widgets/extra_button.dart';
import 'package:fractal_codex/modules/race/view/widgets/left_right_button.dart';
import 'package:fractal_codex/modules/race/view/widgets/race_image.dart';
import 'package:fractal_codex/shared/appbar/game_bar.dart';

class RaceSelectScreen extends ConsumerWidget {
  const RaceSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double textScaler = MediaQuery.of(context).textScaler.scale(1);
    Size scaler = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const GameBar(false, 'Choose Your Race'),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: scaler.height * 0.02),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16 * textScaler,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
              menuHeight: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.3,
              menuStyle: MenuStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.white)),
              enableSearch: false,
              requestFocusOnTap: false,
              initialSelection: ref.watch(racePickerProvider),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 'Human', label: 'Human'),
                DropdownMenuEntry(value: 'Elf', label: 'Elf'),
                DropdownMenuEntry(value: 'Dwarf', label: 'Dwarf'),
                DropdownMenuEntry(value: 'Orc', label: 'Orc'),
              ],
              onSelected: (value) {
                ref.watch(racePickerProvider.notifier).changeRace(value!);
              },
            ),
          ),
          SizedBox(
            height: scaler.height * 0.05,
          ),
          Row(
            children: [
              SizedBox(
                width: scaler.width * 0.06,
              ),
              const Expanded(
                flex: 1,
                child: LeftRightButton('left')
              ),
              SizedBox(
                width: scaler.width * 0.06,
              ),
              Expanded(
                  flex: 3, child: RaceImage(ref.watch(racePickerProvider))),
              SizedBox(
                width: scaler.width * 0.06,
              ),
              const Expanded(
                flex: 1,
                child: LeftRightButton('right')
              ),
              SizedBox(
                width: scaler.width * 0.06,
              ),
            ],
          ),
          SizedBox(
            height: scaler.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: scaler.width * 0.25,
              ),
              const Expanded(
                flex: 3,
                child: ExtraRaceButton('details')
              ),
              const Expanded(
                flex: 3,
                child: ExtraRaceButton('stats')
              ),
              SizedBox(
                width: scaler.width * 0.25,
              ),
            ],
          ),

        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(goRouterProvider).pop();
        },
        child: const Icon(CupertinoIcons.back),
      ),
    );
  }
}
