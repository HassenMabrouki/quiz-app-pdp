import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final void Function(int) answerQuetions;

  Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuetions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question((questions[questionIndex]['questionText'] as String)),
        ...(questions[questionIndex]['answers'] as List)
            .map((answer) {
         
          return Answer(
              () => answerQuetions(
                     answer['score']!,
                  ),
              answer['text'].toString());
        }).toList()
      ],
    );
  }
}
