import 'package:adv_basicss/answer_button.dart';
import 'package:adv_basicss/data/jsQuestions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JsScreen extends StatefulWidget {
  const JsScreen({super.key, required this.ontapAnswer});
  final void Function(String answer) ontapAnswer;
  @override
  State<JsScreen> createState() {
    return _JsScreenState();
  }
}

class _JsScreenState extends State<JsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selecteJsdAnswer) {
    widget.ontapAnswer(selecteJsdAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = jsQuestions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.jsText,
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