import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tim_archy_app/BusinessLogic/Authentication.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/home.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;

Widget displayRegister(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final AuthenticationAirlux _auth = new AuthenticationAirlux();
  String _email = "";
  String _password = "";

  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            children: [
              makeText("Adresse mail", Colors.black, 26, FontStyle.normal,
                  FontWeight.bold),
              TextField(
                onChanged: (value) {
                  globals.setUserEmail(value);
                },
                decoration: InputDecoration(
                  hintText: "Entrez votre adresse mail",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            children: [
              makeText("Mot de passe", Colors.black, 26, FontStyle.normal,
                  FontWeight.bold),
              TextField(
                onChanged: (value) {
                  globals.setUserPwd(value);
                },
                decoration: InputDecoration(
                  hintText: "Entrez votre mot de passe",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      FractionallySizedBox(
        widthFactor: 0.55,
        child: InkWell(
          onTap: () async => {
            await _auth.signup(_email, _password).then((value) async {
              print(value);
              final Map<String, dynamic> parsedData =
                  await jsonDecode(value.toString());
              final bool signed = parsedData['signed'];
              print(signed);
              if (signed) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Compte crée'),
                  backgroundColor: Colors.lightGreen,
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Erreur lors de la création'),
                    backgroundColor: Colors.blueGrey));
              }
            })
          },
          child: makeCustomButton(
              const Color(0xFF40A8C4), 5.0, 25.0, 25.0, 5.0, "INSCRIPTION"),
        ),
      ),
    ],
  );
}
