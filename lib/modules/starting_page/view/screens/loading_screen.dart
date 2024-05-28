import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/colors/colors.dart';
import 'package:fractal_codex/modules/starting_page/controller/starting_page_controller.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Loading',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Flexible(
            child: Stack(alignment: Alignment.center, children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.70,
                child: LinearProgressIndicator(
                  semanticsLabel: 'Loading Bar',
                  borderRadius: BorderRadius.circular(20),
                  value: ref.watch(loadingPageProvider),
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation(GameColors().green),
                ),
              ),
              Text(
                '80%',
                style: TextStyle(color: GameColors().black),
              ),
            ]),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(loadingPageProvider.notifier).debugButton();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
