import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer({this.answerText, this.selectHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          this.answerText,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: this.selectHandler,
      ),
    );
  }
}
