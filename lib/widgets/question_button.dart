import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final String answer;
  final int answer_index;

  QuestionButton(this.answer, this.answer_index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(answer),
      onPressed: () {},
    );
  }
}
