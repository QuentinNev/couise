class Question {
  String caption;
  List<String> answers;
  int correctAnswerIndex;
  String hint;

  Question(this.caption, this.answers, this.correctAnswerIndex, this.hint);

  factory Question.none() {
    return Question("", [], 0, "");
  }
}
