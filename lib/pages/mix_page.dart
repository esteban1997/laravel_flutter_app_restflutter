// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors, avoid_function_literals_in_foreach_calls, avoid_print, avoid_init_to_null

import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/models/button_model.dart';
import 'package:rest_flutter/models/chip_model.dart';
import 'package:rest_flutter/models/group_model.dart';
import 'package:rest_flutter/models/image_model.dart';
import 'package:rest_flutter/models/text_model.dart';
import 'package:rest_flutter/rest_api/provider/mix_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';

class MixPage extends StatelessWidget with PageComponent {
  static const String ROUTE = '/mix';

  @override
  Widget build(BuildContext context) {
    late GroupModel? groupModel = null;
    late String? urlMix = null;
    print("define");
    print(urlMix == null);

    if (ModalRoute.of(context)!.settings.arguments is String) {
      urlMix = ModalRoute.of(context)!.settings.arguments as String;
    } else {
      groupModel = ModalRoute.of(context)!.settings.arguments as GroupModel;
    }

    print("inicia");
    return Scaffold(
      appBar:
          AppBar(title: Text(groupModel != null ? groupModel.name : urlMix!)),
      drawer: CustomDrawer.getDrawer(context),
      body: SingleChildScrollView(
          child: urlMix != null
              ? futureBuilderMixUrl(MixProvider.getMixsUrl, urlMix, context)
              : futureBuilderMix(MixProvider.getMixs, groupModel!.id,
                  context)) /*child: Column(children: _buildWidget())*/,
    );
  }

/*
  List<Widget> _buildWidget() {
    List models = getData();

    List<Widget> widgets = [];
    models.forEach((model) {
      widgets.add(model.func(model));
    });

    return widgets;
  }
*/
//obtener data y modelo
  List getData() {
    List models = [];

    for (int i = 0; i < 5; i++) {
      models.add(ButtonModel.constructor(
          color: "FFFFFFFF",
          colorBG: "FFFF0000",
          text: "Brrrrruno $i",
          type: "flat"));
    }

    for (int i = 0; i < 10; i++) {
      models.add(ChipModel.constructor(
          colorIcon: "FFFFFFFF",
          colorBG: "FFFF0000",
          label: "Brrrrruno $i",
          icon: "access_alarm"));
    }

    for (int i = 0; i < 5; i++) {
      models.add(ButtonModel.constructor(
          color: "FFFFFFFF",
          colorBG: "FF00FF00",
          text: "Brrrrruno $i",
          type: "raised"));
    }

    for (int i = 0; i < 5; i++) {
      models.add(TextModel.constructor(text: "Pedrrrro"));
    }

    for (int i = 0; i < 5; i++) {
      models.add(ImageModel.constructor(
          "https://images.freeimages.com/images/large-previews/648/bs-04-1255720.jpg"));
    }

    return models;
  }
}
