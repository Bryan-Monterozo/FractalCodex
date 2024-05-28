import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RaceImage extends ConsumerWidget {
  const RaceImage(this.raceSelected, {super.key});

  final String raceSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double textScaler = MediaQuery.of(context).textScaler.scale(1);
    Size scaler = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      height: scaler.height * 0.30,
      width: scaler.width * 0.40,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Text(
        raceSelected,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16 * textScaler,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
