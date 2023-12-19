import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y question correctly!'),
            const SizedBox(height: 30),
            const Text('list of answers and question...'),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}