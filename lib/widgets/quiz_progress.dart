import 'package:flutter/material.dart';

class QuizProgress extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;

  const QuizProgress({
    Key? key,
    required this.currentIndex,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Question ${currentIndex + 1}/$totalQuestions',
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}