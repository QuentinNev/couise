import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:couise/models/question.dart';
import 'package:couise/services/question_provider.dart';

class QuestionIoProvider implements QuestionProvider {
  Future<Question> fetch() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Question(json['caption'], json['answers'],
          json['correct_answer_index'], json['hint']);
    } else {
      throw Exception(response.reasonPhrase!);
    }
  }
}
