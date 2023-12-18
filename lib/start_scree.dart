import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key}); // Concept - Lifting state up

  final void Function() startQuiz;
  final double length = 300;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Quiz image
          Image.asset(
            "assets/images/quiz-logo.png",
            width: length,
            height: length,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // Another method to show opacity in image
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     width: 300,
          //     color: const Color.fromARGB(150, 255, 255, 255),
          //   ),
          // ),

          const SizedBox(
            height: 80,
          ),

          // Quiz line
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // Quiz start button
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
