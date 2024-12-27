class Question {
  final String questionText;
  final bool isCorrect;
  final String imageUrl;

  Question({
    required this.questionText,
    required this.isCorrect,
    required this.imageUrl,
  });
}

// Questions list
final List<Question> quizQuestions = [
  Question(
    questionText: 'Le football a été inventé en Angleterre',
    isCorrect: true,
    imageUrl: 'assets/images/angleterre.png',
  ),
  Question(
    questionText: 'Zinedine Zidane a remporté trois Ballons d’Or.',
    isCorrect: false,
    imageUrl: 'assets/images/zidane.jpeg',
  ),
  Question(
    questionText: 'Lionel Messi a remporté la Coupe du Monde 2022 avec l’Argentine',
    isCorrect: true,
    imageUrl: 'assets/images/messi.jpg',
  ),
];