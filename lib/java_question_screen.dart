import 'package:adv_basicss/answer_button.dart';
import 'package:adv_basicss/data/javaQuestions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JavaScreen extends StatefulWidget {
  const JavaScreen({super.key, required this.ontapAnswer});
  final void Function(String answer) ontapAnswer;
  @override
  State<JavaScreen> createState() {
    return _JavaScreenState();
  }
}

class _JavaScreenState extends State<JavaScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedJavaAnswer) {
    widget.ontapAnswer(selectedJavaAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = javaQuestions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.javaText,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 190, 138, 233),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 10,
            ),
            ...currentQuestion.getshuffeledanswers().map((answer) {
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
