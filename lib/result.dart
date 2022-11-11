// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {super.key});
  String get finalResult {
    String result;
    if (resultScore == 3) {
      result = "Excellent";
      print(result);
      print('3/3');
    } else if (resultScore == 2) {
      result = "Good";
      print(result);
      print('2/3');
    } else if (resultScore == 1) {
      result = "Average";
      print(result);
      print('1/3');
    } else {
      result = "Poor";
      print(result);
      print('0/3');
    }
    return result;
  }

  int get finalScore {
    List<int> distinct;
    globals.scoreList.add(resultScore);
    print(globals.scoreList);
    distinct = globals.scoreList.toSet().toList();
    print(distinct);
    distinct.sort(((a, b) => b.compareTo(a)));
    print(distinct);
    int highestScore = distinct.elementAt(0);
    print(highestScore);
    return highestScore;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 100.0)),
          Text(
            "$finalResult!",
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 68, 0, 255),
              ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Score: ' '$resultScore/3',
            style: const TextStyle(
              fontSize: 36, 
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 68, 0, 255),
              height: 1.2),
            textAlign: TextAlign.center,
          ),
          Text(
            'Highest Score: ' '$finalScore/3',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold,height: 1.6),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 68, 0, 255),
              ),
              onPressed: resetHandler,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Try Again',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
