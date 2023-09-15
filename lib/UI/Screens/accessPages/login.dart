import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/home.dart';

Widget displayLogin(BuildContext context)
{
  final screenHeight = MediaQuery.of(context).size.height;

  return
    Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0.05*screenHeight),
          child: makeFormSizedBox("Nom d'utilisateur", "Entrez votre nom d'utilisateur"),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 0.05*screenHeight),
          child: makeFormSizedBox("Mot de passe", "Entrez votre mot de passe"),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 0.025*screenHeight),
          child: FractionallySizedBox(
            widthFactor: 0.55,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder : (context) => HomePage())
              ),
              child: makeCustomButton(const Color(0xFF235784), 25.0, 5.0, 5.0, 25.0, "CONNEXION"),
            ),
          ),
        ),

        makeText("Mot de passe oublié ?", const Color(0xFF40A8C4), 18, FontStyle.normal, FontWeight.bold),
      ]
    );
}