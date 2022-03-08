import 'package:couise/managers/game_manager.dart';
import 'package:couise/widgets/question_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import 'package:couise/managers/question_manager.dart';
import 'package:couise/models/question.dart';

import 'package:couise/widgets/question_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Question"),
      ),
      body: _QuestionView(),
      floatingActionButton: FloatingActionButton(
        onPressed: QuestionManager.instance.next,
        tooltip: 'New Question',
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}

class _QuestionView extends StatelessWidget with GetItMixin {
  _QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Connects the the QuestionManager event stream
    AsyncSnapshot<Question> snapshot =
        watchStream((QuestionManager m) => m.stream, Question.none());

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 100,
      ),
      child: Center(
        child: _buildSnapshot(context, snapshot),
      ),
    );
  }

  Widget _buildSnapshot(
      BuildContext context, AsyncSnapshot<Question> snapshot) {
    if (snapshot.hasData) {
      GameManager.instance.addQuestion(snapshot.data!);

      // Display question
      List<Widget> answers = [];
      answers.add(QuestionView(snapshot.data!));
      int i = 0;
      answers.add(ButtonBar(
          children: snapshot.data!.answers.map((value) {
        i++;
        return QuestionButton(value, i - 1);
      }).toList()));

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: answers,
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}',
          style: TextStyle(color: Colors.red, fontSize: 32));
    }
    return const CircularProgressIndicator();
  }
}
