import 'package:couise/models/question.dart';
import 'package:get_it/get_it.dart';

class GameManager {
  late int score;
  late Question currentQuestion;
  late bool correct;

  GameManager() {
    score = 0;
  }

  void addQuestion(Question question) {
    currentQuestion = question;
  }

  void answerQuestion(int index) {
    if (index == currentQuestion.correctAnswerIndex) {
      score++;
      correct = true;
    } else {
      correct = false;
    }

    // Show answer page
    
  }

  void nextQuestion()
  {

  }

  static void register() {
    GetIt.I.registerLazySingleton(() => GameManager());
  }

  static GameManager get instance => GetIt.I.get<GameManager>();
}
