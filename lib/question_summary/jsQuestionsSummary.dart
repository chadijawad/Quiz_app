import 'package:adv_basicss/question_summary/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JsQuestionsSummary extends StatelessWidget {
  const JsQuestionsSummary(
    this.summaryData, {
    super.key,
  });
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrectAnswer =
                data['user_js_answers'] == data['correct_js_answers'];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIdentifier(
                    isCorrectAnswer: isCorrectAnswer,
                    questionIndex: data['question_index'] as int),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        data['questionJs'] as String,
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_js_answers'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 202, 171, 252)),
                      ),
                      Text(
                        data['correct_js_answers'] as String,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 181, 254, 246)),
                      ),
                    ]))
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
