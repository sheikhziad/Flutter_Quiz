import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questions;

  const Question(this.questions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(top: 70.0, bottom: 25.0),
      child: Text(
        questions,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
