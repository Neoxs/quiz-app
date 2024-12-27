import 'package:flutter/material.dart';

class AnswerButtons extends StatelessWidget {
  final bool? selectedAnswer;
  final bool correctAnswer;
  final Function(bool) onAnswerSelected;

  const AnswerButtons({
    Key? key,
    required this.selectedAnswer,
    required this.correctAnswer,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAnswerButton(true),
        _buildAnswerButton(false),
      ],
    );
  }

  Widget _buildAnswerButton(bool isTrue) {
  return GestureDetector(
    onTap: selectedAnswer == null 
        ? () => onAnswerSelected(isTrue)
        : null,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: selectedAnswer == isTrue
            ? (correctAnswer == isTrue ? Colors.teal : Colors.deepOrange)
            : Colors.blueGrey, // Default button color
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      child: Center(
        child: Text(
          isTrue ? 'VRAI' : 'FAUX',
          style: TextStyle(
            color: Colors.white, // Text color
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

}