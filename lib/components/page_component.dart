// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';

class PageComponent {
  List<Widget> buildWidgets(List models, Function fun, context) {
    List<Widget> widgets = [];
    models.forEach((model) {
      widgets.add(fun(model, context));
    });

    return widgets;
  }

  Widget buildWidget(Object models, Function func, BuildContext context) {
    return func(models, context);
  }

  /*
  listado de botones rest API*/

  Widget futureBuilder(Function future, Function build, BuildContext context) {
    return FutureBuilder(
      future: future(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
        if (snapshot.hasData) {
          return Column(children: buildWidgets(snapshot.data!, build, context));
        } else {
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }

  /*
  listado de botones rest API*/

  Widget futureBuilderMix(Function future, int groupId, BuildContext context) {
    return FutureBuilder(
      future: future(groupId),
      builder: (BuildContext context, AsyncSnapshot<List> mixSnapshot) {
        if (mixSnapshot.hasData) {
          final mixsModel = mixSnapshot.data;

          List<Widget> widgets = [];
          if (mixsModel != null) {
            mixsModel.forEach((mix) {
              widgets.add(buildWidget(mix.object, mix.object.func, context));
            });
          }

          return Column(children: widgets);
        } else {
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }

  /*
  listado de botones rest API*/

  Widget futureBuilderMixUrl(
      Function future, String url, BuildContext context) {
    return FutureBuilder(
      future: future(url),
      builder: (BuildContext context, AsyncSnapshot<List> buttonSnapshot) {
        if (buttonSnapshot.hasData) {
          final mixsModel = buttonSnapshot.data;

          List<Widget> widgets = [];
          if (mixsModel != null) {
            mixsModel.forEach((mix) {
              widgets.add(buildWidget(mix.object, mix.object.func, context));
            });
          }

          return Column(children: widgets);
        } else {
          print("Cargando");
          return CircularProgressIndicator();
        }
      },
    );
  }
}
