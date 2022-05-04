class CardQuestionModel {
  int id;
  String title;
  List<_Question> questions;

  CardQuestionModel(
      {required this.id, required this.title, required this.questions});

  CardQuestionModel.fromJsonMapToObbject(Map<String, dynamic> cardQuestion)
      : id = cardQuestion['id'],
        title = cardQuestion['title'],
        questions = cardQuestion['questions']
            .map<_Question>((q) => _Question.fromJsonMapToObbject(q))
            .toList();
}

class _Question {
  int id;
  String title;
  String img;
  bool res;
  int r;
  int g;
  int b;

  _Question({
    required this.id,
    required this.title,
    required this.img,
    required this.res,
    required this.r,
    required this.g,
    required this.b,
  });

  _Question.fromJsonMapToObbject(Map<String, dynamic> question)
      : id = question['id'],
        title = question['title'],
        img = question['img'],
        res = question['res'] == 1,
        r = question['r'] ?? 255,
        g = question['g'] ?? 0,
        b = question['b'] ?? 0;
}
