// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/pages/mix_page.dart';
import 'package:rest_flutter/rest_api/provider/group_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';

class GroupsPage extends StatelessWidget with PageComponent {
  static const String ROUTE = '/groups';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GroupsPage")),
      drawer: CustomDrawer.getDrawer(context),
      body:
          _futureBuilder(), //Column(children: buildWidgets(getData(), ButtonWidget.build)),
    );
  }

  /*
  listado de botones rest API*/

  Widget _futureBuilder() {
    final groupProvider = GroupProvider();

    return FutureBuilder(
      future: groupProvider.getGroups(),
      builder:
          (BuildContext context, AsyncSnapshot<List<dynamic>?> groupSnapshot) {
        if (groupSnapshot.hasData) {
          List<Widget> buttons = [];

          groupSnapshot.data!.forEach((group) {
            buttons.add(ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MixPage.ROUTE, arguments: group);
                },
                child: Text(group.name)));
          });

          return Column(children: buttons);
        } else {
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }
}
