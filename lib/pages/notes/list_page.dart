// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rest_flutter/models/note_model.dart';
import 'package:rest_flutter/pages/notes/save_page.dart';
import 'package:rest_flutter/rest_api/provider/note_provider.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);
  static const String ROUTE = '/noteList';

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<NoteModel> items = [];
  bool isLoading = false;
  int currentPage = 0;

  @override
  void initState() {
    _loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, SavePage.ROUTE,
                arguments: NoteModel.empty());
          },
        ),
        appBar: AppBar(
          title: Text("notas"),
        ),
        drawer: CustomDrawer.getDrawer(context),
        body: Column(children: [
          Expanded(
              child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (currentPage < NoteProvider.lastPage &&
                  !isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                _loadData();

                setState(() {
                  isLoading = true;

                  print("set state 1");
                });
              }
              return true;
            },
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _createItem(index);
                }),
          )),
          Container(
            height: isLoading ? 50.0 : 0,
            child: Center(child: CircularProgressIndicator()),
          )
        ]));
  }

  Widget _createItem(int index) {
    return Slidable(
      child: ListTile(
        title: Text(items[index].title),
      ),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.35,
        children: [
          SlidableAction(
            label: 'Borrar',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (context) {
              setState(() {
                NoteProvider.deleteNote(items[index].id!);
                items.removeAt(index);
              });
            },
          ),
          SlidableAction(
            label: 'Editar',
            backgroundColor: Colors.blue,
            icon: Icons.edit,
            onPressed: (context) {
              Navigator.pushNamed(context, SavePage.ROUTE,
                  arguments: items[index]);
            },
          ),
        ],
      ),
    );
  }

  Future _loadData() async {
    currentPage++;

    List<NoteModel> auxItems = await NoteProvider.getNotes(currentPage);

    items.addAll(auxItems);

    setState(() {
      isLoading = false;
    });
  }
}
