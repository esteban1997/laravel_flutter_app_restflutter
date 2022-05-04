// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/models/text_model.dart';
import 'package:rest_flutter/rest_api/provider/text_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';
import 'package:rest_flutter/widgets/text_widget.dart';

class TextPage extends StatelessWidget with PageComponent {
  static const String ROUTE = '/text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ButtonsPage")),
      drawer: CustomDrawer.getDrawer(context),
      body: futureBuilder(TextProvider().getTexts, TextWidget.build,
          context), //Column(children: buildWidgets(getData(), TextWidget.build)),
    );
  }

//obtener data y modelo
  List<TextModel> getData() {
    List<TextModel> textModels = [];

    for (int i = 0; i < 5; i++) {
      textModels.add(TextModel.constructor(text: "Pedrrrro"));
    }

    return textModels;
  }
}
