import 'package:adv_basicss/data/c++Questions.dart';
import 'package:adv_basicss/question_summary/cppQuestionSummary.dart';
import 'package:adv_basicss/restart_button.dart';
import 'package:flutter/material.dart';

class CppResultScreen extends StatelessWidget {
  const CppResultScreen(
      {super.key, required this.chosenanswerss, required this.restart});
  final void Function() restart;
  final List<String> chosenanswerss;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenanswerss.length; i++) {
      summary.add({
        'question_index': i,
        'questionCpp': cppQuestions[i].cppText,
        'correct_cpp_answers': cppQuestions[i].cppAnswers[0],
        'user_cpp_answers': chosenanswerss[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestion = cppQuestions.length;
    final numberofCorrectAnswer = summaryData.where((data) {
      return data['user_cpp_answers'] == data['correct_cpp_answers'];
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
            CppQuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            RestartButton(text: 'estart quiz', ontap: restart),
          ],
        ),
      ),
    );
  }
}
