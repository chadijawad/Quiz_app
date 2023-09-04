import 'package:adv_basicss/models/c++_questions.dart';
const cppQuestions = [
  CppQuestions('Which keyword is used to declare a variable in C++?', [
    'int',
    'var',
    'variable',
    'declare',
  ]),
  CppQuestions(
      'In C++, what is the keyword used to declare a constant variable?', [
    'const',
    'constant',
    'var',
    'immutable',
  ]),
  CppQuestions(
      'What is the storage class specifier for variables that are accessible throughout the program?',
      [
        'global',
        'static',
        'dynamic',
        'public',
      ]),
  CppQuestions(
      'In C++, what does the `auto` keyword do when declaring variables?', [
    'Automatically deduces the data type of the variable.',
    'Declares a variable that is automatically initialized to zero.',
    'Declares a variable with automatic storage duration.',
    'Defines an array of variables.',
  ]),
  CppQuestions(
      'Which keyword is used to define an alias for a data type in C++?', [
    'typedef',
    'alias',
    'type',
    'define',
  ]),
  CppQuestions(
      'What is the scope of a variable declared using the `static` keyword in C++?',
      [
        'The variable has static duration and scope limited to its block.',
        'The variable has function scope.',
        'The variable has global scope.',
        'The variable has block scope.',
      ])
];
