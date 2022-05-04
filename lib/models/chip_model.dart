// ignore_for_file: avoid_print

import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/widgets/chip_widget.dart';

class ChipModel {
  late String colorIcon;
  late String colorBG;
  late String label;
  late String icon;
  late Function func;
  bool? behavior;
  BehaviorModel? behaviorModel;

  ChipModel.constructor(
      {required this.colorIcon,
      required this.colorBG,
      required this.label,
      required this.icon,
      this.func = ChipWidget.build,
      this.behavior});

  ChipModel.fromJsonMapToObject(Map<String, dynamic> item) {
    label = item['label'];
    colorBG = item['color_bg'].replaceFirst("#", "FF");
    colorIcon = item['color'].replaceFirst("#", "FF");
    icon = item['icon'];
    func = ChipWidget.build;

    behavior = item['behavioral_id'] != null;
    if (behavior!) {
      print("entro behavior no nulo en chip");
      behaviorModel = BehaviorModel.fromJsonMapToObject(item);
    }
  }
}
