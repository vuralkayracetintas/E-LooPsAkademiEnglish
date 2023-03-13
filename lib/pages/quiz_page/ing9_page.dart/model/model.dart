// ignore_for_file: camel_case_types

class Ing9QuestionModel {
  String question;
  String answer;

  Ing9QuestionModel({required this.question, required this.answer});

  void setQuestion(String getQuestion) {
    question = getQuestion;
  }

  void setAnswer(String getAnswer) {
    answer = getAnswer;
  }

  String getQuestion() {
    return question;
  }

  String getAnswer() {
    return answer;
  }
}
