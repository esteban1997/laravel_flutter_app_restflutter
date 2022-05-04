// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, constant_identifier_names

import 'package:rest_flutter/models/text_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class TextProvider extends BaseProvider {
  @override
  List<TextModel> jsonArrayToList(List<dynamic> jsonList) {
    List<TextModel> textsModel = [];

    jsonList.forEach((element) {
      textsModel.add(TextModel.fromJsonMapToObject(element));
    });
    return textsModel;
  }

  Future<List?> getTexts() async {
    return await sendRequest('api/text/all');
  }
}
