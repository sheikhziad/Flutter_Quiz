// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _myAppState();
}

// ignore: camel_case_types
class _myAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'Q1. Who created flutter?',
      'answers': [
        {'text': 'Facebook', 'score': 0},
        {'text': 'Amazon', 'score': 0},
        {'text': 'Google', 'score': 1},
        {'text': 'Microsoft', 'score': 0},
      ]
    },
    {
      'questionText': 'Q2. What is flutter?',
      'answers': [
        {'text': 'Design Software', 'score': 0},
        {'text': 'Android Application', 'score': 0},
        {'text': 'Web Application', 'score': 0},
        {'text': 'Android Development Kit', 'score': 1},
      ]
    },
    {
      'questionText': 'Q3. What is used to build easy flutter application?',
      'answers': [
        {'text': 'FlutterFollow', 'score': 0},
        {'text': 'FlutterFlow', 'score': 1},
        {'text': 'FlutterFire', 'score': 0},
        {'text': 'FlutterGo', 'score': 0},
      ]
    },
  ];

  var questionIndex = 0;
  int totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;

    setState(() {
      questionIndex += 1;
    });

    print(questionIndex);
    if (questionIndex < questions.length) {
      print("We have more questions!");
    } else {
      print("No more Questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 120,
                color: const Color.fromARGB(255, 68, 0, 255),
                child: const Center(
                  child: Text(
                    "Flutter Quiz",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            questionIndex < questions.length
                ? Quiz(
                    ansQ: answerQuestion,
                    qIndex: questionIndex,
                    q: questions,
                  )
                : Result(totalScore, resetQuiz),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Colors.transparent,
          child: ClipPath(
            clipper: WaveClipperOne(flip: true, reverse: true),
            child: Container(
              height: 80.0,
              color: const Color.fromARGB(255, 68, 0, 255),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
