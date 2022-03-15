import 'package:couise/managers/question_manager.dart';
import 'package:couise/models/question.dart';
import 'package:get_it/get_it.dart';

class GameManager {
  late int score;
  late Question currentQuestion;
  late bool correct;

  late int questionIndex = 0;
  late int maxQuestions = 3;

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

    questionIndex++;

    if (questionIndex >= maxQuestions) {
      // FINISH
    } else {
      // Next question
      QuestionManager.instance.next();
    }
  }

  void nextQuestion() {}

  static void register() {
    GetIt.I.registerLazySingleton(() => GameManager());
  }

  static GameManager get instance => GetIt.I.get<GameManager>();
}
