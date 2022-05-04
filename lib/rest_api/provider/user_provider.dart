// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:rest_flutter/utils/key.dart';
import 'package:http/http.dart' as http;
import 'package:rest_flutter/utils/user_preference.dart';

class UserProvider {
  static const String _BASEURL = Key.BASEURL;

  static Future<String?> login(String username, String password) async {
    final dataPost = {'username': username, 'password': password};

    final res =
        await http.post(Uri.parse(_BASEURL + 'api/login'), body: dataPost);

    final data = json.decode(res.body);

    if (data == null) return null;
    if (data['token'] == null) return null;

    return data['token'];
  }

  static Future<bool> verify() async {
    final userPreference = UserPreference();
    Map<String, String> headers = {
      'accept': 'application/json',
      'authorization': userPreference.token,
    };

    final res =
        await http.get(Uri.parse(_BASEURL + 'api/verify'), headers: headers);

    final data = json.decode(res.body);

    if (data == null) return false;
    if (data['data'] == null) return false;

    return true;
  }

  static logout() async {
    final userPreference = UserPreference();

    Map<String, String> headers = {
      'accept': 'application/json',
      'authorization': userPreference.token,
    };

    await http.post(Uri.parse(_BASEURL + 'api/logout'), headers: headers);

    userPreference.token = "";
  }
}
