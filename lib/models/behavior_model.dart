// ignore_for_file: non_constant_identifier_names

class BehaviorModel {
  int behavioral_id;
  String behavioral_type;
  String behavioral_model;
  String content1;
  String content2;

  BehaviorModel.fromJsonMapToObject(Map<String, dynamic> item)
      : behavioral_id = item['behavioral_id'],
        behavioral_type = item['behavioral_type'],
        behavioral_model = item['behavioral_model'],
        content1 = item['content1'],
        content2 = item['content2'];
}
