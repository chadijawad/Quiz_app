class DartQuestions {
  const DartQuestions(this.dartText, this.dartAnswers);
  final String dartText;
  final List<String> dartAnswers;

  List<String> getshuffeledanswers() {
    final shuffeledList = List.of(dartAnswers);
    shuffeledList.shuffle();
    return shuffeledList;
  }
}
