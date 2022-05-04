// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:rest_flutter/models/text_model.dart';

class TextWidget {
  /*final ChipModel chipModel;

  const ChipWidget(this.chipModel);*/

  static Widget build(TextModel textModel, BuildContext context) {
    return buildWidget(textModel, context);
  }

  static Widget buildWidget(TextModel textModel, BuildContext context) {
    return Text(textModel.text);
  }
}
