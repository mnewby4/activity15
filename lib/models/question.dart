import 'package:html_unescape/html_unescape.dart';

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var unescape = HtmlUnescape();

    List<String> options = List<String>.from(json['incorrect_answers']);
    List<String> optionStrings = [];
    for (int i = 0; i <= options.length - 1; i++) {
      String newString = unescape.convert(options[i]);
      optionStrings.add(newString);
    }
    optionStrings.add(unescape.convert(json['correct_answer']));
    optionStrings.shuffle();

    return Question(
      question: unescape.convert(json['question']),
      options: optionStrings,
      correctAnswer: unescape.convert(json['correct_answer'])
    );
  }
}
