class JavaQuestions {
  const JavaQuestions(this.javaText, this.javaAnswers);
  final String javaText;
  final List<String> javaAnswers;

  List<String> getshuffeledanswers() {
    final shuffeledList = List.of(javaAnswers);
    shuffeledList.shuffle();
    return shuffeledList;
  }
}