// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, constant_identifier_names

import 'dart:convert';

import 'package:rest_flutter/models/note_model.dart';
import 'package:rest_flutter/utils/key.dart';
import 'package:http/http.dart' as http;

class NoteProvider {
  static const String _BASEURL = Key.BASEURL;
  static int lastPage = 0;

  static Future<List<NoteModel>> _sendRequest(String token) async {
    final res = await http.get(Uri.parse(_BASEURL + token));

    final data = json.decode(res.body);
    lastPage = data['data']['last_page'];

    return _jsonArrayToList(data['data']['data']);
  }

  static List<NoteModel> _jsonArrayToList(List<dynamic> jsonList) {
    List<NoteModel> notesModel = [];

    jsonList.forEach((element) {
      notesModel.add(NoteModel.fromJsonMapToObject(element));
    });
    return notesModel;
  }

  static Future<List<NoteModel>> getNotes(page) async {
    return await _sendRequest('api/note?page=$page');
  }

  static deleteNote(int id) async {
    await http.delete(Uri.parse(_BASEURL + "api/note/$id"));
  }

  static Future<Map> saveNote(String title, String content, [int? id]) async {
    final form = {'title': title, 'content': content};

    print('id $id');
    final res = id != null
        ? await http.post(Uri.parse(_BASEURL + "api/note/$id"), body: form)
        : await http.post(Uri.parse(_BASEURL + "api/note"), body: form);
    print(res.body);
    final data = json.decode(res.body);

    final code = data['code'];

    final map = {'code': code};

    if (code != 200) {
      //errores
      if (data['msj']['title'] != null) {
        map.addAll({'title': data['msj']['title'][0]});
      } else if (data['msj']['content'] != null) {
        map.addAll({'content': data['msj']['content'][0]});
      }
    }

    print(map);

    return map;
  }
}
