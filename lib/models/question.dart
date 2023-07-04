import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.options,
  });
}

List<Question> sample_data = [];

Future<void> fetchTriviaData(int limit) async {
  int id = 1;
  final response = await http.get(Uri.parse('https://the-trivia-api.com/v2/questions?limit=$limit'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    // Iterate through each trivia item
    for (final triviaItem in jsonData) {
      final question = triviaItem['question']['text'];
      final correctAnswer = triviaItem['correctAnswer'];
      final incorrectAnswers = triviaItem['incorrectAnswers'];
      List<String> options = [correctAnswer, ...incorrectAnswers];

      // Randomly shuffle the options
      final random = Random();
      options.shuffle(random);

      sample_data.add(Question(id: id, question: question, answer: options.indexOf(correctAnswer), options: options));
      print(sample_data[sample_data.length-1].question);
      print(sample_data[sample_data.length-1].answer);
      print(sample_data[sample_data.length-1].options);
      id++;
    }
  } else {
    throw Exception('Failed to fetch trivia data');
  }
}