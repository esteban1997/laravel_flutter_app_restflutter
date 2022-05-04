// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:rest_flutter/models/chip_model.dart';
import 'package:rest_flutter/utils/behavior.dart';

class ChipWidget {
  /*final ChipModel chipModel;

  const ChipWidget(this.chipModel);*/

  static Widget build(ChipModel chipModel, BuildContext context) {
    return buildWidget(chipModel, context);
  }

  static Widget buildWidget(ChipModel chipModel, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (chipModel.behavior != null && chipModel.behavior!) {
          print("comportamiento");
          Behavior.porcess(chipModel.behaviorModel!, context);
        }
      },
      child: Chip(
          backgroundColor: Color(int.parse(chipModel.colorBG, radix: 16)),
          avatar: CircleAvatar(
              child: Icon(Icons.access_alarm),
              backgroundColor:
                  Color(int.parse(chipModel.colorIcon, radix: 16))),
          label: Text(chipModel.label)),
    );
  }
}
