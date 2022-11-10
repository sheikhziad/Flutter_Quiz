import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerToText;

  const Answer(this.selectHandler, this.answerToText, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: selectHandler,
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white)),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 68, 0, 255)),
                ),
          child: Text(answerToText),
        ),
      ),
    );
  }
}
