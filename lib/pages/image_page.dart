// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:rest_flutter/components/page_component.dart';
import 'package:rest_flutter/models/image_model.dart';
import 'package:rest_flutter/rest_api/provider/imagen_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';
import 'package:rest_flutter/widgets/image_widget.dart';

class ImagePage extends StatelessWidget with PageComponent {
  static const String ROUTE = '/image';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ButtonsPage")),
      drawer: CustomDrawer.getDrawer(context),
      body: SingleChildScrollView(
          child: futureBuilder(ImagenProvider().getImages, ImageWidget.build,
              context)), //Column(children: buildWidgets(getData(), ImageWidget.build))),
    );
  }

//obtener data y modelo
  List<ImageModel> getData() {
    List<ImageModel> imageModel = [];

    for (int i = 0; i < 5; i++) {
      imageModel.add(ImageModel.constructor(
          "https://images.freeimages.com/images/large-previews/648/bs-04-1255720.jpg"));
    }

    return imageModel;
  }
}
