import 'dart:math';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    const _questions = const [
      {
        'questionText': 'What\'s your name?',
        'answers': ['Dudu', 'Ciri', 'Yen']
      },
      {
        'questionText': 'How old are you?',
        'answers': ['100', '30', '400']
      },
      {
        'questionText': 'Que?',
        'answers': ['Que no los Dos', 'What?', 'Meh']
      },
      {
        'questionText': 'What\'s funny?',
        'answers': ['You', 'Your Mom', '...']
      },
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Short Quiz')),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestionHandler: _answerQuestion,
                )
              : Result(
                  resetHandler: _resetQuiz,
                )),
    );
  }

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }
}