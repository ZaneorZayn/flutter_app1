class QuestionAnswer {
  final String question;
  final String answer;
  final String author;

  QuestionAnswer({
    required this.question,
    required this.answer,
    required this.author,
  });
}

final List<QuestionAnswer> fakeQnA = [
  QuestionAnswer(
    question: 'How to manage state in Flutter?',
    answer: 'You can manage state using setState, Provider, Bloc, etc.',
    author: 'John Doe',
  ),
  QuestionAnswer(
    question: 'What is the difference between StatelessWidget and StatefulWidget?',
    answer: 'StatelessWidget is immutable, whereas StatefulWidget has mutable state.',
    author: 'Jane Smith',
  ),
];