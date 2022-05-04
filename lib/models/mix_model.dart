import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/models/chip_model.dart';
import 'package:rest_flutter/models/image_model.dart';
import 'package:rest_flutter/models/text_model.dart';
import 'package:rest_flutter/widgets/button_widget.dart';
import 'package:rest_flutter/widgets/chip_widget.dart';
import 'package:rest_flutter/widgets/image_widget.dart';
import 'package:rest_flutter/widgets/text_widget.dart';

class MixModel {
  late String widget;
  late Object object;
  late Function func;

  MixModel.constructor({required this.widget, required this.object});

  MixModel.fromJsonMapToObject(Map<String, dynamic> item) {
    widget = item['widget'];
    switch (widget) {
      case "button":
        func = ButtonWidget.build;
        object = ButtonModel.fromJsonMapToObject(item);
        break;
      case "text":
        func = TextWidget.build;
        object = TextModel.fromJsonMapToObject(item);
        break;
      case "image":
        func = ImageWidget.build;
        object = ImageModel.fromJsonMapToObject(item);
        break;
      case "chip":
        func = ChipWidget.build;
        object = ChipModel.fromJsonMapToObject(item);
        break;
    }
  }
}
