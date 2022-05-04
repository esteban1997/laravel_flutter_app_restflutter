// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, constant_identifier_names

import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class ButtonProvider extends BaseProvider {
  @override
  List<ButtonModel> jsonArrayToList(List<dynamic> jsonList) {
    List<ButtonModel> buttonsModel = [];

    jsonList.forEach((element) {
      buttonsModel.add(ButtonModel.fromJsonMapToObject(element));
    });
    return buttonsModel;
  }

  Future<List?> getButtons() async {
    return await sendRequest('api/button/all');
  }
}
