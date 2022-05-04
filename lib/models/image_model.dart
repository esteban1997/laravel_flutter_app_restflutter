// ignore_for_file: prefer_initializing_formals, avoid_print

import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/utils/key.dart';
import 'package:rest_flutter/widgets/image_widget.dart';

class ImageModel {
  late String url;
  late String name;
  Function func = ImageWidget.build;
  bool? behavior;
  BehaviorModel? behaviorModel;

  ImageModel.constructor(String url) {
    this.url = url;
  }

  ImageModel.fromJsonMapToObject(Map<String, dynamic> item) {
    url = Key.BASEURL + "images/" + item['url'];

    behavior = item['behavioral_id'] != null;
    if (behavior!) {
      print("entro behavior no nulo en imagen");
      behaviorModel = BehaviorModel.fromJsonMapToObject(item);
    }
  }
}
