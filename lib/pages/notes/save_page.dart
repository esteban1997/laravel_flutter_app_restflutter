// ignore_for_file: constant_identifier_names, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:rest_flutter/models/note_model.dart';
import 'package:rest_flutter/pages/notes/list_page.dart';
import 'package:rest_flutter/rest_api/provider/note_provider.dart';

class SavePage extends StatefulWidget {
  SavePage({Key? key}) : super(key: key);
  static const String ROUTE = '/note-save';

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final titleController = TextEditingController();
  final contentcontroller = TextEditingController();
  String titleError = "";
  String contentError = "";

  late NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    noteModel = ModalRoute.of(context)!.settings.arguments as NoteModel;

    print("_______________");
    print(noteModel.id);

    titleController.text = noteModel.title;
    contentcontroller.text = noteModel.content;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("crear nota")),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 10),
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorText: titleError == "" ? null : titleError,
                        labelText: "Titulo",
                        hintText: "Titulo"),
                    validator: (value) {
                      contentError = "";
                      titleError = "";
                      if (value!.isEmpty) {
                        return "ingrese un valor";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: contentcontroller,
                    maxLines: 8,
                    maxLength: 1000,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorText: contentError == "" ? null : contentError,
                        labelText: "Contenido",
                        hintText: "Contenido"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "ingrese un valor";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        contentError = "";
                        titleError = "";
                        if (_formKey.currentState!.validate()) {
                          createNote();
                        }
                      },
                      child: Text("crear"))
                ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  createNote() async {
    Map map = await NoteProvider.saveNote(
        titleController.text, contentcontroller.text, noteModel.id);

    if (map['code'] != 200) {
      if (map['title'] != null) {
        titleError = map['title'];
      } else if (map['content'] != null) {
        titleError = map['content'];
      }
    } else {
      final snackBar = SnackBar(content: Text("procesando datos"));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.of(context).pushNamedAndRemoveUntil(
          ListPage.ROUTE, (Route<dynamic> route) => false);
    }

    setState(() {});
  }
}
