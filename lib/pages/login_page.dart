// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, constant_identifier_names, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rest_flutter/pages/groups_page.dart';
import 'package:rest_flutter/rest_api/provider/user_provider.dart';
import 'package:rest_flutter/utils/user_preference.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();

  final passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  var buttonSending = false;

  @override
  Widget build(BuildContext context) {
    userController.text = 'estebanaguirre19972@gmail.com';
    passwordController.text = 'esteban123';
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: _form(context),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Card(
      child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                children: [
                  _userField(),
                  SizedBox(
                    height: 10,
                  ),
                  _passwordField(),
                  SizedBox(
                    height: 10,
                  ),
                  _sendDataFromButton(context),
                ],
              ),
            ),
          )),
    );
  }

  Widget _userField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "El campo no puede ser vacio";
        } else {
          return null;
        }
      },
      controller: userController,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: "Usuario"),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "El campo no puede ser vacio";
        } else {
          return null;
        }
      },
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: "Contraseña"),
    );
  }

  Widget _sendDataFromButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: buttonSending
            ? null
            : () async {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    buttonSending = true;
                  });

                  final token = await UserProvider.login(
                      userController.text, passwordController.text);
                  Timer(Duration(seconds: 3), () {
                    setState(() {
                      buttonSending = false;
                    });
                  });

                  if (token != null) {
                    final userPreference = UserPreference();
                    userPreference.token = token;

                    print("toodo bien");

                    Navigator.pushReplacementNamed(context, GroupsPage.ROUTE);
                  } else {
                    Alert(
                            context: context,
                            title: "Error",
                            desc: "Usuario y/o contraseña incorrectas")
                        .show();
                  }
                } else {
                  print("probblemas en el form");
                }
              },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: Text(
            "Enviar",
            style: TextStyle(fontSize: 17, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
