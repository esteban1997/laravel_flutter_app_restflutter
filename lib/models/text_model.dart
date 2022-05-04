import 'package:rest_flutter/widgets/text_widget.dart';

class TextModel {
  String text;
  Function func;

  TextModel.constructor({required this.text, this.func = TextWidget.build});

  TextModel.fromJsonMapToObject(Map<String, dynamic> item)
      : text = item['text'],
        func = TextWidget.build;
}
