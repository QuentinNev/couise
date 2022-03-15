import 'package:flutter/material.dart';
import 'package:couise/models/question.dart';

class QuestionView extends StatelessWidget {
  final Question question;
  final double padding;

  const QuestionView(this.question, {Key? key, this.padding = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(children: <Widget>[
        Text(question.caption,
            style: const TextStyle(color: Colors.blue, fontSize: 48)),
        Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Hint : " + question.hint,
              style: TextStyle(
                  color: Colors.blue[200], fontSize: 36),
            )
        ),
      ]),
    );
  }
}
