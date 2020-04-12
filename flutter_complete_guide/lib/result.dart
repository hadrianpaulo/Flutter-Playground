import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetHandler;

  Result({this.resetHandler});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(30),
          child: Text(
            'You did it!',
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        RaisedButton(
          color: Colors.lightGreen,
          child: Text(
            "Reset!",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: this.resetHandler,
        )
      ],
    );
  }
}
