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

  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Column(
              children: [
                makeText("Adresse mail", Colors.white, 26, FontStyle.normal,
                    FontWeight.bold),
                SizedBox(height: 5.0,),
                TextField(
                  onChanged: (value) {
                    globals.setUserEmail(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Entrez votre adresse mail",
                    hintStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
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
                makeText("Mot de passe", Colors.white, 26, FontStyle.normal,
                    FontWeight.bold),
                SizedBox(height: 5.0,),
                TextField(
                  onChanged: (value) {
                    globals.setUserPwd(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Entrez votre mot de passe",
                    hintStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
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
            child:
            makeCustomButton(
                Colors.white, 10.0, 30.0, 30.0, 10.0, "INSCRIPTION"),
          ),
        ),
      ],
    ),
  );
}
