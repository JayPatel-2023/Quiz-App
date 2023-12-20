import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_scree.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';
  var _isRestart = false;

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
      _isRestart = false;
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    // Compare tottal no.of question with total no. of answers
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'result-screen';
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _isRestart = true;
      _activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'start-screen' && _isRestart) {
      screenWidget = StartScreen(_switchScreen);
    }

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: _chooseAnswer);
    }

    if (_activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
          chosenAnswers: _selectedAnswers, onRestart: _restartQuiz);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),

          // Starting Quiz using ternary operator to achieve rendering content Conditionally.
          child: screenWidget,
        ),
      ),
    );
  }
}
