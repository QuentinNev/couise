import 'package:couise/models/question.dart';

abstract class QuestionProvider {
  Future<Question> fetch();
}
