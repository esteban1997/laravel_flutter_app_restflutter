// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/rest_api/provider/button_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';
import 'package:rest_flutter/widgets/button_widget.dart';

class ButtonsPage extends StatelessWidget with PageComponent {
  static const String ROUTE = '/buttons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ButtonsPage")),
      drawer: CustomDrawer.getDrawer(context),
      body: futureBuilder(ButtonProvider().getButtons, ButtonWidget.build,
          context), //Column(children: buildWidgets(getData(), ButtonWidget.build)),
    );
  }

//obtener data y modelo
  List<ButtonModel> getData() {
    List<ButtonModel> buttonModels = [];

    for (int i = 0; i < 5; i++) {
      buttonModels.add(ButtonModel.constructor(
          color: "FFFFFFFF",
          colorBG: "FFFF0000",
          text: "Brrrrruno $i",
          type: "flat"));
    }

    for (int i = 0; i < 5; i++) {
      buttonModels.add(ButtonModel.constructor(
          color: "FFFFFFFF",
          colorBG: "FF00FF00",
          text: "Brrrrruno $i",
          type: "raised"));
    }
    return buttonModels;
  }
}
