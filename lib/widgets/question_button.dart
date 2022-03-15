import 'package:couise/managers/game_manager.dart';
import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final String answer;
  final int answerIndex;

  const QuestionButton(this.answer, this.answerIndex, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(answer),
      onPressed: () => 
      GameManager.instance.answerQuestion(answerIndex),
      style: ElevatedButton.styleFrom(
          alignment: Alignment.center, primary: Colors.blue),
    );
  }
}
