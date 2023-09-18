import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/home.dart';
import 'package:tim_archy_app/BusinessLogic/Authentication.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;

Widget displayLogin(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  final AuthenticationAirlux _auth = new AuthenticationAirlux();
  String _email = "";
  String _password = "";

  return Column(children: [
    Padding(
      padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          onChanged: (value) {
            _email = value;
            globals.setUserEmail(value);
            print(_email);
          },
          decoration: InputDecoration(
            hintText: "Entrez votre adresse mail",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          onChanged: (value) {
            _password = value;
            globals.setUserPwd(value);
            print(_password);
          },
          decoration: InputDecoration(
            hintText: "Entrez votre mot de passe",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(bottom: 0.025 * screenHeight),
      child: FractionallySizedBox(
        widthFactor: 0.55,
        child: InkWell(
          onTap: () async => {
            await _auth.login(_email, _password).then((value) async {
              print(value);
              final Map<String, dynamic> parsedData =
                  await jsonDecode(value.toString());
              final bool authenticated = parsedData['authenticated'];
              final String data = parsedData['data'];
              if (authenticated) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Email ou mot de passe incorrect'),
                  backgroundColor: Colors.blueGrey,
                ));
              }
            })
          },
          child: makeCustomButton(
              const Color(0xFF235784), 25.0, 5.0, 5.0, 25.0, "CONNEXION"),
        ),
      ),
    ),
    InkWell(
      child: makeText("Mot de passe oublié ?", const Color(0xFF40A8C4), 18,
          FontStyle.normal, FontWeight.bold),
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
                    child: makeText(
                      "Renseignez votre adresse email pour recevoir un email de réinitialisation",
                      Colors.black,
                      20,
                      FontStyle.normal,
                      FontWeight.bold,
                      txtAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                    child: makeTextField("Entrer votre adresse email"),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: makeCustomButton(const Color(0xFF40A8C4), 25.0, 25.0,
                        25.0, 25.0, "Valider",
                        btnWidth: 0.3 * screenWidth),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  ]);
}
