// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, constant_identifier_names

import 'package:rest_flutter/models/chip_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class ChipProvider extends BaseProvider {
  @override
  List<ChipModel> jsonArrayToList(List<dynamic> jsonList) {
    List<ChipModel> chipsModel = [];

    jsonList.forEach((element) {
      chipsModel.add(ChipModel.fromJsonMapToObject(element));
    });
    return chipsModel;
  }

  Future<List?> getChips() async {
    return await sendRequest('api/chip/all');
  }
}
