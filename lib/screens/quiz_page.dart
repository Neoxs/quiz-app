import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/question_card.dart';
import '../widgets/answer_buttons.dart';
import '../widgets/quiz_progress.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int _score = 0;
  bool? _selectedAnswer;

  void _checkAnswer(bool userAnswer) {
    setState(() {
      _selectedAnswer = userAnswer;
      if (userAnswer == quizQuestions[_currentIndex].isCorrect) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_selectedAnswer != null) {
      setState(() {
        if (_currentIndex < quizQuestions.length - 1) {
          _currentIndex++;
          _selectedAnswer = null;
        } else {
          _showResults();
        }
      });
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Terminé!'),
          content: Text(
            'Votre score: $_score/${quizQuestions.length}\n'
            'Pourcentage: ${(_score / quizQuestions.length * 100).toStringAsFixed(1)}%',
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                  _score = 0;
                  _selectedAnswer = null;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Recommencer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(
          color: Colors.white
        )),
        backgroundColor: Colors.indigo[800],
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionCard(
              question: quizQuestions[_currentIndex],
            ),
            const SizedBox(height: 20),
            AnswerButtons(
              selectedAnswer: _selectedAnswer,
              correctAnswer: quizQuestions[_currentIndex].isCorrect,
              onAnswerSelected: _checkAnswer,
            ),
            const SizedBox(height: 20),
            if (_selectedAnswer != null)
              ElevatedButton.icon(
                onPressed: _nextQuestion,
                icon: const Icon(Icons.arrow_forward),
                label: Text(
                  _currentIndex < quizQuestions.length - 1 
                    ? 'Question Suivante'
                    : 'Voir les Résultats'
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[100],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            QuizProgress(
              currentIndex: _currentIndex,
              totalQuestions: quizQuestions.length,
            ),
          ],
        ),
      ),
    );
  }
}