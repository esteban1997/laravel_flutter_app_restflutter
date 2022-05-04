class GroupModel {
  int id;
  String name;

  GroupModel.constructor({required this.id, required this.name});

  GroupModel.fromJsonMapToObject(Map<String, dynamic> item)
      : id = item['id'],
        name = item['name'];
}
