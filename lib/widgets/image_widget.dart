// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:rest_flutter/models/image_model.dart';
import 'package:rest_flutter/utils/behavior.dart';

class ImageWidget {
  /*final ChipModel chipModel;

  const ChipWidget(this.chipModel);*/

  static Widget build(ImageModel imageModel, BuildContext context) {
    return buildWidget(imageModel, context);
  }

  static Widget buildWidget(ImageModel imageModel, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (imageModel.behavior != null && imageModel.behavior!) {
          print("comportamiento");
          Behavior.porcess(imageModel.behaviorModel!, context);
        }
      },
      child: FadeInImage(
        image: NetworkImage(imageModel.url),
        placeholder: AssetImage('assets/images/load.jpg'),
      ),
    );
  }
}
