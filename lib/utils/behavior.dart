// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:rest_flutter/models/behavior_model.dart';
import 'package:rest_flutter/pages/mix_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Behavior {
  static porcess(BehaviorModel behaviorModel, BuildContext context) async {
    switch (behaviorModel.behavioral_model) {
      case "url":
        print("url");
        if (await canLaunchUrl(Uri.parse(behaviorModel.content1))) {
          await launchUrl(Uri.parse(behaviorModel.content1));
        }
        break;
      case "resource":
        print("resource");
        Navigator.pushNamed(context, MixPage.ROUTE,
            arguments: behaviorModel.content1);
        break;
      case "content":
        print("content");
        break;
      default:
    }
  }
}
