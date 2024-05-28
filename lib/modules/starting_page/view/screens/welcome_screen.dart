import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fractal_codex/core/routes/route_name.dart';
import 'package:fractal_codex/core/routes/routes.dart';
import 'package:fractal_codex/modules/starting_page/controller/starting_page_controller.dart';
import 'package:fractal_codex/modules/starting_page/view/widgets/confirm_button.dart';
import 'package:fractal_codex/shared/appbar/game_bar.dart';

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
