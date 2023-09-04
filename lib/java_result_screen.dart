
import 'package:adv_basicss/data/javaQuestions.dart';
import 'package:adv_basicss/question_summary/javaQuestionsSummary.dart';
import 'package:adv_basicss/restart_button.dart';
import 'package:flutter/material.dart';

class JavaResultScreen extends StatelessWidget {
  const JavaResultScreen(
      {super.key, required this.chosenanswerss, required this.restart});
  final void Function() restart;
  final List<String> chosenanswerss;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenanswerss.length; i++) {
      summary.add({
        'question_index': i,
        'questionJava': javaQuestions[i].javaText,
        'correct_java_answers': javaQuestions[i].javaAnswers[0],
        'user_java_answers': chosenanswerss[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestion = javaQuestions.length;
    final numberofCorrectAnswer = summaryData.where((data) {
      return data['user_java_answers'] == data['correct_java_answers'];
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
            JavaQuestionsSummary(summaryData),
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
