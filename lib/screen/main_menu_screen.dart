import 'package:flutter/material.dart';

import 'game_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'assets/images/racing_main.png',
          fit: BoxFit.cover,
          opacity: AlwaysStoppedAnimation(0.5),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Flutter Racer',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              onPressed: () {
                //버튼을 클릭하면 내부가 실행됨.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GameScreen()));
              },
              child: const Text(
                'GAME START',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ))
        ]),
      ]),
    );
  }
}
