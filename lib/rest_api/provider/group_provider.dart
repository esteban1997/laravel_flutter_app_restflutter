// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, constant_identifier_names

import 'package:rest_flutter/models/group_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class GroupProvider extends BaseProvider {
  @override
  List<GroupModel> jsonArrayToList(List<dynamic> jsonList) {
    List<GroupModel> groupsModel = [];

    jsonList.forEach((element) {
      groupsModel.add(GroupModel.fromJsonMapToObject(element));
    });
    return groupsModel;
  }

  Future<List?> getGroups() async {
    return await sendRequest('api/group/all');
  }
}
