// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, constant_identifier_names, use_key_in_widget_constructors, sized_box_for_whitespace, avoid_print, prefer_is_empty

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_flutter/models/card_question_model.dart';
import 'package:rest_flutter/models/match_card.dart';
import 'package:rest_flutter/utils/custom_drawer.dart';
import 'package:rest_flutter/extension/strings.dart';

class CardPage extends StatefulWidget {
  static const String ROUTE = '/dcard';

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>
    with SingleTickerProviderStateMixin {
  late CardQuestionModel _cardQuestionModel;
  late List<Widget> _cardList;
  bool _accepted = false;
  bool _inDragTarget1 = false;
  bool _inDragTarget2 = false;
  late AnimationController _animationController;
  late Animation<double> _animationCardOpacity;
  late bool _userResponse = true;
  int qTotal = 0;
  int qGood = 0;
  int qBad = 0;

  final String _tempJson =
      '{ "id" : 1, "title" : "Animales" , "questions" :[{"id":1,"title" : "es un gato?", "img" : "https://images.freeimages.com/images/large-previews/bd1/cat-1404368.jpg" , "res":1},{"r": 255, "g": 255, "b": 155, "id":1,"title" : "es un perro?", "img" : "https://images.freeimages.com/images/large-previews/502/cat-1393633.jpg" , "res":0},{"r": 0, "g": 255, "b": 155, "id":1,"title" : "es un perro?", "img" : "https://images.freeimages.com/images/large-previews/9ed/cat-1360210.jpg" , "res":0}]}';

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animationCardOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.linear, parent: _animationController));

    _cardQuestionModel =
        CardQuestionModel.fromJsonMapToObbject(json.decode(_tempJson));

    _getMatchCard();
    print(_cardQuestionModel.questions.length);
    qTotal = _cardQuestionModel.questions.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Scaffold(
        /*appBar: AppBar(title: Text("Cartas Arrastrables")),
        drawer: CustomDrawer.getDrawer(context),*/
        body: Stack(
      children: [
        SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  _cardQuestionModel.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                ),
              )),
        ),
        AnimatedContainer(
            duration: Duration(milliseconds: 100),
            width: _inDragTarget1 ? 60 : 50,
            height: double.infinity,
            color: Color.fromARGB(_inDragTarget1 ? 200 : 150, 0, 0, 0),
            child: DragTarget<String>(
              onMove: (_) {
                print("onmove 1");
                setState(() {
                  _inDragTarget1 = true;
                });
              },
              onLeave: (_) {
                print("onmove 2");
                setState(() {
                  _inDragTarget1 = false;
                });
              },
              onWillAccept: (data) {
                return true;
              },
              onAccept: (String data) {
                _processResponse(data.parseBool(), true);
              },
              builder: (_, candidateData, rejectedData) {
                return Center(
                  child: Text(
                    "Si",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                );
              },
            )),
        Align(
            alignment: Alignment.center,
            child: FadeTransition(
                opacity: _animationCardOpacity,
                child: _cardList.length > 0
                    ? _cardList[0]
                    : Container(
                        child: Center(
                            child: Text(
                          "finalizo preguntas",
                          style: TextStyle(fontSize: 30),
                        )),
                      ))),
        Align(
          alignment: Alignment.topRight,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: _inDragTarget2 ? 60 : 50,
              height: double.infinity,
              color: Color.fromARGB(_inDragTarget2 ? 200 : 150, 0, 0, 0),
              child: DragTarget<String>(
                onMove: (_) {
                  setState(() {
                    _inDragTarget2 = true;
                  });
                },
                onLeave: (_) {
                  setState(() {
                    _inDragTarget2 = false;
                  });
                },
                onWillAccept: (data) {
                  return true;
                },
                onAccept: (String data) {
                  _processResponse(data.parseBool(), false);
                },
                builder: (_, candidateData, rejectedData) {
                  return Center(
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  );
                },
              )),
        ),
        Center(child: _finished()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
              color: Color.fromARGB(255, 255, 100, 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              margin: EdgeInsets.all(0),
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(qGood.toString()),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(qTotal.toString()),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(qBad.toString()),
                      ),
                    ]),
              )),
        )
      ],
    ));
  }

  _getMatchCard() {
    _cardList = [];

    for (var q in _cardQuestionModel.questions) {
      _cardList.add(Draggable<String>(
        axis: Axis.horizontal,
        data: q.res.toString(),
        child: _buildWidget(q),
        feedback: _buildWidget(q),
        childWhenDragging: Container(),
        onDragEnd: (_) {},
      ));
    }
  }

  Card _buildWidget(q) {
    return Card(
      color: Color.fromARGB(255, q.r, q.g, q.b),
      elevation: 12,
      child: Container(
        padding: EdgeInsets.all(8),
        width: 240,
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/images/load.jpg",
                      image: q.img,
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 7),
            Text(q.title, style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void _removeCard() {
    _cardList.removeAt(0);
  }

  Widget _finished() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      child: Center(
        child: Text(
          _userResponse ? "Bien" : "Fallo",
          overflow: TextOverflow.fade,
          softWrap: false,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      width: _accepted ? 300 : 0,
      height: _accepted ? 300 : 0,
      decoration: BoxDecoration(
          color: Color.fromARGB(
              150, _userResponse ? 0 : 255, _userResponse ? 255 : 0, 0),
          shape: BoxShape.circle),
    );
  }

  void _processResponse(bool resCard, bool resDragTarget) {
    setState(() {
      //proceso respuesta
      _userResponse = resCard == resDragTarget;

      if (_userResponse) {
        qGood++;
      } else {
        qBad++;
      }

//remover carta
      _removeCard();

      _accepted = true;
      _inDragTarget1 = false;
      _inDragTarget2 = false;

      //animaciones
      _animationController.reset();
      _animationController.forward();
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _accepted = false;
      });
    });
  }
}
