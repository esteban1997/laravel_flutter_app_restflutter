// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/utils/behavior.dart';

class ButtonWidget {
  /*final ButtonModel buttonModel;

  const ButtonWidget(this.buttonModel);*/

  static Widget build(ButtonModel buttonModel, BuildContext context) {
    return buildWidget(buttonModel, context);
  }

  static Widget buildWidget(ButtonModel buttonModel, BuildContext context) {
    switch (buttonModel.type) {
      case "flat":
        return TextButton(
          onPressed: () {
            if (buttonModel.behavior != null && buttonModel.behavior!) {
              print("comportamiento");
              Behavior.porcess(buttonModel.behaviorModel!, context);
            }
          },
          child: Text(
            buttonModel.text,
          ),
          style: TextButton.styleFrom(
              primary: Color(int.parse(buttonModel.color, radix: 16)),
              backgroundColor:
                  Color(int.parse(buttonModel.colorBG, radix: 16))),
        );
      default:
        return ElevatedButton(
          onPressed: () {
            if (buttonModel.behavior != null && buttonModel.behavior!) {
              print("comportamiento");
              Behavior.porcess(buttonModel.behaviorModel!, context);
            }
          },
          child: Text(
            buttonModel.text,
          ),
          style: TextButton.styleFrom(
              primary: Color(int.parse(buttonModel.color, radix: 16)),
              backgroundColor:
                  Color(int.parse(buttonModel.colorBG, radix: 16))),
        );
    }
  }
}
