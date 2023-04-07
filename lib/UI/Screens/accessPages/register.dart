import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import '../home.dart';

Widget displayRegister(BuildContext context)
{
  final screenHeight = MediaQuery.of(context).size.height;

  return
    Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0.025*screenHeight),
          child: makeFormSizedBox("Nom d'utilisateur", "Entrer votre nom d'utilisateur"),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 0.025*screenHeight),
          child: makeFormSizedBox("Adresse email", "Enter votre mot de passe"),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 0.05*screenHeight),
          child: makeFormSizedBox("Mot de passe", "Enter votre mot de passe"),
        ),

        FractionallySizedBox(
          widthFactor: 0.55,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder : (context) => HomePage())
            ),
            child: makeCustomButton(Color(0xFF40A8C4), 5.0, 25.0, 25.0, 5.0, "INSCRIPTION"),
          ),
        ),
      ],
    );
}