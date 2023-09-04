import 'package:adv_basicss/start_quiz_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
      this.startQuiz, this.startJavaQuiz, this.startJsQuiz, this.startCppQuiz,
      {super.key});
  final void Function() startQuiz;
  final void Function() startJavaQuiz;
  final void Function() startJsQuiz;
  final void Function() startCppQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 300,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(40, 104, 58, 183),
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  'assets/images/download.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Programing The fun way',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 190, 138, 233),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StartQuizButton(quizAnswerText: 'java', onStart: startJavaQuiz),
              StartQuizButton(quizAnswerText: 'flutter', onStart: startQuiz),
              StartQuizButton(
                  quizAnswerText: 'JavaScript', onStart: startJsQuiz),
              StartQuizButton(quizAnswerText: 'cpp', onStart: startCppQuiz)
            ],
          ),
        ],
      ),
    );
  }
}
