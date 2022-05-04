// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, constant_identifier_names

import 'dart:convert';

import 'package:rest_flutter/models/mix_model.dart';
import 'package:rest_flutter/utils/key.dart';
import 'package:http/http.dart' as http;

class MixProvider {
  static const String _BASEURL = Key.BASEURL;

  static Future<List<MixModel>> _sendRequest(String token) async {
    print(_BASEURL + token);
    final res = await http.get(Uri.parse(_BASEURL + token));

    final data = json.decode(res.body);

    return _jsonArrayToList(data['data']);
  }

  static List<MixModel> _jsonArrayToList(List<dynamic> jsonList) {
    List<MixModel> mixsModel = [];

    jsonList.forEach((element) {
      mixsModel.add(MixModel.fromJsonMapToObject(element));
    });
    return mixsModel;
  }

  static Future<List<MixModel>> getMixs(int groupId) async {
    return await _sendRequest('api/mix/$groupId');
  }

  static Future<List<MixModel>> getMixsUrl(String url) async {
    return await _sendRequest(url);
  }
}
