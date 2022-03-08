import 'package:couise/managers/game_manager.dart';
import 'package:couise/managers/question_manager.dart';
import 'package:couise/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  QuestionManager.register();
  GameManager.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
