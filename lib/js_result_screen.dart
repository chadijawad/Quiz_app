import 'package:adv_basicss/data/javaQuestions.dart';
import 'package:adv_basicss/data/jsQuestions.dart';
import 'package:adv_basicss/question_summary/jsQuestionsSummary.dart';
import 'package:adv_basicss/restart_button.dart';
import 'package:flutter/material.dart';

class JsResultScreen extends StatelessWidget {
  const JsResultScreen(
      {super.key, required this.chosenJsanswerss, required this.restart});
  final void Function() restart;
  final List<String> chosenJsanswerss;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenJsanswerss.length; i++) {
      summary.add({
        'question_index': i,
        'questionJs': jsQuestions[i].jsText,
        'correct_js_answers': jsQuestions[i].jsAnswers[0],
        'user_js_answers': chosenJsanswerss[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestion = javaQuestions.length;
    final numberofCorrectAnswer = summaryData.where((data) {
      return data['user_js_answers'] == data['correct_js_answers'];
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
            JsQuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            RestartButton(text: 'restart', ontap: restart),
          ],
        ),
      ),
    );
  }
}
