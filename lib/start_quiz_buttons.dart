import 'package:flutter/material.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton(
      {super.key, required this.quizAnswerText, required this.onStart});
  final String quizAnswerText;
  final void Function() onStart;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onStart,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
        side: const BorderSide(color: Color.fromARGB(255, 167, 151, 194)),
      ),
      icon: const Icon(Icons.arrow_right_alt),
      label: Text(quizAnswerText),
    );
  }
}
