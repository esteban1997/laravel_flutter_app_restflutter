// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:rest_flutter/pages/buttons_page.dart';
import 'package:rest_flutter/pages/chips_page.dart';
import 'package:rest_flutter/pages/dragable/card_page.dart';
import 'package:rest_flutter/pages/groups_page.dart';
import 'package:rest_flutter/pages/image_page.dart';
import 'package:rest_flutter/pages/login_page.dart';
import 'package:rest_flutter/pages/mix_page.dart';
import 'package:rest_flutter/pages/notes/list_page.dart';
import 'package:rest_flutter/pages/notes/save_page.dart';
import 'package:rest_flutter/pages/text_page.dart';
import 'package:rest_flutter/rest_api/provider/user_provider.dart';
import 'package:rest_flutter/utils/user_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userPreference = UserPreference();
  await userPreference.initPreferences();

  var initialRoute = LoginPage.ROUTE;
/*
  if (userPreference.token != "" && await UserProvider.verify()) {
    print("primer ruta");
    initialRoute = GroupsPage.ROUTE;
  } else {
    print("segunda ruta");
    initialRoute = LoginPage.ROUTE;
  }*/

  initialRoute = userPreference.token != '' && await UserProvider.verify()
      ? GroupsPage.ROUTE
      : LoginPage.ROUTE;

  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: CardPage.ROUTE /*initialRoute*/, routes: {
      ChipsPage.ROUTE: (BuildContext context) => ChipsPage(),
      ButtonsPage.ROUTE: (BuildContext context) => ButtonsPage(),
      TextPage.ROUTE: (BuildContext context) => TextPage(),
      ImagePage.ROUTE: (BuildContext context) => ImagePage(),
      MixPage.ROUTE: (BuildContext context) => MixPage(),
      GroupsPage.ROUTE: (BuildContext context) => GroupsPage(),
      ListPage.ROUTE: (BuildContext context) => ListPage(),
      SavePage.ROUTE: (BuildContext context) => SavePage(),
      LoginPage.ROUTE: (BuildContext context) => LoginPage(),
      CardPage.ROUTE: (BuildContext context) => CardPage(),
    });
  }
}
