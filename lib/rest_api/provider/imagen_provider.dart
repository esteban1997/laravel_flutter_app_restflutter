// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, constant_identifier_names

import 'package:rest_flutter/models/image_model.dart';
import 'package:rest_flutter/rest_api/provider/base_provider.dart';

class ImagenProvider extends BaseProvider {
  @override
  List<ImageModel> jsonArrayToList(List<dynamic> jsonList) {
    List<ImageModel> imagesModel = [];

    jsonList.forEach((element) {
      imagesModel.add(ImageModel.fromJsonMapToObject(element));
    });
    return imagesModel;
  }

  Future<List?> getImages() async {
    return await sendRequest('api/image/all');
  }
}
