import 'package:adv_basicss/data/dartQuestions.dart';
import 'package:adv_basicss/question_summary/questions_summary.dart';
import 'package:adv_basicss/restart_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenanswers, required this.restart});
  final void Function() restart;
  final List<String> chosenanswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenanswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': dartQuestionns[i].dartText,
        'correct_answers': dartQuestionns[i].dartAnswers[0],
        'user_answers': chosenanswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestion = dartQuestionns.length;
    final numberofCorrectAnswer = summaryData.where((data) {
      return data['user_answers'] == data['correct_answers'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answer $numberofCorrectAnswer out of $numberOfTotalQuestion correctly!',
              style: const TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            RestartButton(text: 'restart quiz', ontap: restart),
          ],
        ),
      ),
    );
  }
}
