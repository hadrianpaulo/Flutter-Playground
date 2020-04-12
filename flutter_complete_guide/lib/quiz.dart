import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestionHandler;
  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestionHandler});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Question(questionText: questions[questionIndex]['questionText']),
      ...(questions[questionIndex]['answers'] as List<String>).map((data) {
        return Answer(
          answerText: data,
          selectHandler: answerQuestionHandler,
        );
      }).toList()
    ]);
  }
}
