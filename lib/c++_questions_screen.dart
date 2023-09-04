import 'package:adv_basicss/answer_button.dart';
import 'package:adv_basicss/data/c++Questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CppScreen extends StatefulWidget {
  const CppScreen({super.key, required this.ontapAnswer});
  final void Function(String answer) ontapAnswer;
  @override
  State<CppScreen> createState() {
    return _CppScreenState();
  }
}

class _CppScreenState extends State<CppScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.ontapAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = cppQuestions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.cppText,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 190, 138, 233),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                ontap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
