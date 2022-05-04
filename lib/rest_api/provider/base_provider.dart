// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, constant_identifier_names

import 'dart:convert';

import 'package:rest_flutter/utils/key.dart';
import 'package:http/http.dart' as http;
import 'package:rest_flutter/utils/user_preference.dart';

class BaseProvider {
  static const String _BASEURL = Key.BASEURL;

  Future<List?> sendRequest(String token) async {
    final userPreference = UserPreference();

    Map<String, String> headers = {
      'accept': 'application/json',
      'authorization': userPreference.token,
    };

    final res = await http.get(Uri.parse(_BASEURL + token), headers: headers);
    final data = json.decode(res.body);

    return jsonArrayToList(data['data']);
  }

  List? jsonArrayToList(List<dynamic> jsonList) {
    return null;
  }
}
