import 'package:adv_basicss/Js_questions_screen.dart';
import 'package:adv_basicss/c++_questions_screen.dart';
import 'package:adv_basicss/cpp_result_screen.dart';
import 'package:adv_basicss/data/c++Questions.dart';
import 'package:adv_basicss/data/dartQuestions.dart';
import 'package:adv_basicss/data/javaQuestions.dart';
import 'package:adv_basicss/data/jsQuestions.dart';
import 'package:adv_basicss/java_question_screen.dart';
import 'package:adv_basicss/java_result_screen.dart';
import 'package:adv_basicss/js_result_screen.dart';
import 'package:adv_basicss/questions_screen.dart';
import 'package:adv_basicss/result_screen.dart';
import 'package:adv_basicss/start_screnn.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //first methode
  /* Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
  */
  //seconde methode

  List<String> selectedAnswers = [];
  List<String> selectedJavaAnswers = [];
  List<String> selectedCppAnswers = [];
  List<String> selectedJsAnswers = [];

  var activescreen = 'start_screen';
  void switchScreen() {
    setState(() {
      activescreen = 'question_screen';
    });
  }

  void switchJavaScreen() {
    setState(() {
      activescreen = 'java_screen';
    });
  }

  void switchJsScreen() {
    setState(() {
      activescreen = 'Js_screen';
    });
  }

  void switchCppScreen() {
    setState(() {
      activescreen = 'cpp_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == dartQuestionns.length) {
      setState(() {
        activescreen = 'result_screen';
      });
    }
  }

  void chooseJavaAnswer(String answer) {
    selectedJavaAnswers.add(answer);
    if (selectedJavaAnswers.length == javaQuestions.length) {
      setState(() {
        activescreen = 'result_java_screen';
      });
    }
  }

  void chooseCppAnswer(String answer) {
    selectedCppAnswers.add(answer);
    if (selectedCppAnswers.length == cppQuestions.length) {
      setState(() {
        activescreen = 'result_cpp_screen';
      });
    }
  }

  void chooseJsAnswer(String answer) {
    selectedJsAnswers.add(answer);
    if (selectedJsAnswers.length == jsQuestions.length) {
      setState(() {
        activescreen = 'result_js_screen';
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      selectedCppAnswers = [];
      selectedJavaAnswers = [];
      selectedJsAnswers = [];
      activescreen = 'start_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetScreen = StartScreen(
        switchScreen, switchJavaScreen, switchJsScreen, switchCppScreen);
    if (activescreen == 'question_screen') {
      widgetScreen = QuestionsScreen(ontapAnswer: chooseAnswer);
    }
    if (activescreen == 'java_screen') {
      widgetScreen = JavaScreen(ontapAnswer: chooseJavaAnswer);
    }
    if (activescreen == 'Js_screen') {
      widgetScreen = JsScreen(ontapAnswer: chooseJsAnswer);
    }
    if (activescreen == 'cpp_screen') {
      widgetScreen = CppScreen(ontapAnswer: chooseCppAnswer);
    }
    if (activescreen == 'result_java_screen') {
      widgetScreen = JavaResultScreen(
          chosenanswerss: selectedJavaAnswers, restart: restart);
    }
    if (activescreen == 'result_screen') {
      widgetScreen =
          ResultScreen(chosenanswers: selectedAnswers, restart: restart);
    }
    if (activescreen == 'result_js_screen') {
      widgetScreen =
          JsResultScreen(chosenJsanswerss: selectedJsAnswers, restart: restart);
    }
    if (activescreen == 'result_cpp_screen') {
      widgetScreen =
          CppResultScreen(chosenanswerss: selectedCppAnswers, restart: restart);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 78, 13, 168)
            ], begin: Alignment.topLeft, end: Alignment.topRight),
          ),
          child:
              widgetScreen, //if we use the old methode we should use activeScreen;
        ),
      ),
    );
  }
}
