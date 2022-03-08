import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:couise/models/question.dart';
import 'package:couise/services/question_provider.dart';

class QuestionIoProvider implements QuestionProvider {
  Future<Question> fetch() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:4567/questions/next'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      List<dynamic> dynList = json['answers'];
      List<String> stringList = dynList.cast<String>();

      return Question(json['caption'], stringList,
          json['correct_answer_index'], json['hint']);
    } else {
      throw Exception(response.reasonPhrase!);
    }
  }
}
