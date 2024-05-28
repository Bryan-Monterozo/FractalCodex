import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/colors/colors.dart';
import 'package:fractal_codex/core/routes/routes.dart';

class ConfirmButton extends ConsumerWidget {
  final String buttonText;
  final String? onTap;

  const ConfirmButton({super.key, required this.buttonText, this.onTap});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (onTap == 'raceSelect') {
          ref.read(goRouterProvider).pushNamed('race');
        } else {
          null;
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: GameColors().blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
