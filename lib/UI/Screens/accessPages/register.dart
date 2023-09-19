import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tim_archy_app/BusinessLogic/Authentication.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;

Widget displayRegister(context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final AuthenticationAirlux _auth = new AuthenticationAirlux();
  String _email = "";
  String _password = "";

  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
          child: makeFormSizedBox("Adresse email", "Entre votre adresse email", fTxtFdOnChanged: (value) {globals.setUserEmail(value);})
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
          child: makeFormSizedBox("Mot de passe", "Entre votre mot de passe", fTxtFdOnChanged: (value) {globals.setUserPwd(value);})
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
    ),
  );
}
