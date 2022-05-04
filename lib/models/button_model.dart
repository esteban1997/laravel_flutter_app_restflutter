// ignore_for_file: avoid_print

import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/widgets/button_widget.dart';

class ButtonModel {
  late String text;
  late String colorBG;
  late String color;
  late String type;
  late Function func;
  bool? behavior;
  BehaviorModel? behaviorModel;

  ButtonModel.constructor({
    required this.text,
    required this.colorBG,
    required this.color,
    required this.type,
    this.func = ButtonWidget.build,
    this.behavior,
  });

  ButtonModel.fromJsonMapToObject(Map<String, dynamic> item) {
    text = item['label'];
    colorBG = item['color_bg'].replaceFirst("#", "FF");
    color = item['color'].replaceFirst("#", "FF");
    type = item['type'];
    func = ButtonWidget.build;

    behavior = item['behavioral_id'] != null;
    if (behavior!) {
      print("entro behavior no nulo en boton");
      behaviorModel = BehaviorModel.fromJsonMapToObject(item);
    }
  }
}
