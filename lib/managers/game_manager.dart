import 'package:couise/models/question.dart';
import 'package:get_it/get_it.dart';

class GameManager {
  late int score;
  late Question currentQuestion;

  GameManager() {
    score = 0;
  }

  void addQuestion(Question question) {
    currentQuestion = question;
  }

  static void register() {
    GetIt.I.registerLazySingleton(() => GameManager());
  }

  static GameManager get instance => GetIt.I.get<GameManager>();
}
