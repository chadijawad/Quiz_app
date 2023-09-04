
class JsQuestions {
  final String jsText;
  final List<String> jsAnswers;

  const JsQuestions(this.jsText, this.jsAnswers);

  List<String> getShuffledAnswers() {
    List<String> shuffledList = List.from(jsAnswers);
    shuffledList.shuffle();
    return shuffledList;
  }
}