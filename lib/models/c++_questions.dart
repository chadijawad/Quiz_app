class CppQuestions {
  final String cppText;
  final List<String> cppAnswers;

  const CppQuestions(this.cppText, this.cppAnswers);

  List<String> getShuffledAnswers() {
    List<String> shuffledList = List.from(cppAnswers);
    shuffledList.shuffle();
    return shuffledList;
  }
}