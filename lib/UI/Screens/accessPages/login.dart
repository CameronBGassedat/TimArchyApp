import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/home.dart';
import 'package:tim_archy_app/BusinessLogic/Authentication.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;

Widget displayLogin(context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final AuthenticationAirlux auth = AuthenticationAirlux();
  String email = "";
  String password = "";

  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
          child: makeFormSizedBox("Adresse email", "Entrer votre adresse email", fTxtFdOnChanged: (value) {
            email = value;
            globals.setUserEmail(value);
          }),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
            child: makeFormSizedBox("Mot de passe", "Entrer votre mot de passe", fTxtFdOnChanged: (value) {
              password = value;
              globals.setUserPwd(value);
            })
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 0.025 * screenHeight),
          child: FractionallySizedBox(
            widthFactor: 0.55,
            child: InkWell(
              onTap: () async => {
                await auth.login(email, password).then((value) async {
                  final Map<String, dynamic> parsedData =
                  await jsonDecode(value.toString());
                  final bool authenticated = parsedData['authenticated'];
                  if (authenticated) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const HomePage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Email ou mot de passe incorrect'),
                      backgroundColor: Colors.red,
                    ));
                  }
                })
              },
              child: makeCustomButton(const Color(0xFF235784), 25.0, 5.0, 5.0, 25.0, "CONNEXION"),
            ),
          ),
        ),
        InkWell(
          child: makeText("Mot de passe oublié ?", const Color(0xFF40A8C4), 18, FontStyle.normal, FontWeight.bold),
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                        child: makeText("Renseignez votre adresse email pour recevoir un email de réinitialisation", Colors.black, 20, FontStyle.normal, FontWeight.bold, txtAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                        child: makeTextField("Entrer votre adresse email"),
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.of(context).pop();},
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color(0xFF40A8C4)),
                          padding: MaterialStatePropertyAll(EdgeInsets.only(top: 10.0, right: 15.0, bottom: 10.0, left: 15.0)),
                        ),
                        child: makeText("Valider", Colors.white, 24, FontStyle.normal, FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ]
    ),
  );
}
