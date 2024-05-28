import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/colors/colors.dart';

class GameBar extends ConsumerWidget implements PreferredSizeWidget {
  const GameBar(this.backButton, this.barTitle, {super.key});

  final String barTitle;
  final bool backButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: GameColors().black,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        barTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      leading: backButton ? const BackButton() : null,
    );
  }
}
