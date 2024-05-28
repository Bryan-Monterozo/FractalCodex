import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/routes/routes.dart';
import 'package:fractal_codex/shared/appbar/game_bar.dart';

class RaceSelectScreen extends ConsumerWidget {
  const RaceSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const GameBar(false, 'Choose Your Race'),
      body: const Center(
        child: Text("Choose your Race"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(goRouterProvider).pop();
        },
        child: const Icon(CupertinoIcons.back),
      ),
    );
  }
}
