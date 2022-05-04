// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/models/chip_model.dart';
import 'package:rest_flutter/rest_api/provider/chip_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';
import 'package:rest_flutter/widgets/chip_widget.dart';

class ChipsPage extends StatelessWidget with PageComponent {
  static const String ROUTE = '/chips';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ChipPage")),
      drawer: CustomDrawer.getDrawer(context),
      body: futureBuilder(ChipProvider().getChips, ChipWidget.build,
          context), //Column(children: buildWidgets(getData(), ChipWidget.build)),
    );
  }

//obtener data y modelo
  List<ChipModel> getData() {
    List<ChipModel> chipModels = [];

    for (int i = 0; i < 10; i++) {
      chipModels.add(ChipModel.constructor(
          colorIcon: "FFFFFFFF",
          colorBG: "FFFF0000",
          label: "Brrrrruno $i",
          icon: "access_alarm"));
    }
    return chipModels;
  }
}
