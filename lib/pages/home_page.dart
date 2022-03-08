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
        /*actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed:() => Navigator.push(context, MaterialPageRoute(builder:(context) => FavoritePage())),
          ),
        ],
        */
      ),
      body: _QuestionView(),
      floatingActionButton: FloatingActionButton(
        onPressed: QuestionManager.instance.next,
        tooltip: 'New Question',
        child: const Icon(Icons.subdirectory_arrow_left),
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
      List<Widget> answers = [];

      answers.add(QuestionView(snapshot.data!));

      answers.addAll(snapshot.data!.answers.map((value) {
        return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              value,
              style: TextStyle(color: Colors.blue[200], fontSize: 36),
            ));
      }).toList());

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
