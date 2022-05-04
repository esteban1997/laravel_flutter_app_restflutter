class NoteModel {
  int? id;
  late String title = "";
  late String content = "";

  NoteModel.empty();

  NoteModel.fromJsonMapToObject(Map<String, dynamic> item)
      : id = item['id'],
        title = item['title'],
        content = item['content'];
}
