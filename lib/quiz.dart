import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> q;
  final int qIndex;
  final Function ansQ;

const Quiz({
	Key? key,
	required this.q,
	required this.ansQ,
	required this.qIndex,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          q[qIndex]['questionText'] as String,
        ),
        ...(q[qIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => ansQ(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
