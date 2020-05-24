import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {

  final List<Map<String,Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  
  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex
    });


  @override
  Widget build(BuildContext context) {
    return  Column(
                children: [
                  Question(
                    questions[questionIndex]['questionText'],
                  ),
                  ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
                    return Answer(() => answerQuestion(answer['score']), answer['text']);
                  }).toList()

                  // RaisedButton(
                  //   child: Text('Answer 2'),
                  //   onPressed: () => print('Answer 2 chosen!'),
                  // ),
                  // RaisedButton(
                  //   child: Text('Answer 3'),
                  //   onPressed: () {
                  //     // ...
                  //     print('Answer 3 chosen');
                  //   },
                  // ),
                ],
              );
  }
}