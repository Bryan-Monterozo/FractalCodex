import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/modules/starting_page/view/widgets/confirm_button.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // appBar: GameBar(false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Fractal Codex", style: TextStyle(color: Colors.white),),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 50,
              child: const ConfirmButton(buttonText: 'Begin Adventure', onTap: 'raceSelect')
            )
          ],
        ),
      ),
    );
  }
}
