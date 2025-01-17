import 'package:flutter/material.dart';
import 'screens/quiz_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.indigo,
      ),
      home: const QuizPage(title: 'Quiz app'),
    );
  }
}