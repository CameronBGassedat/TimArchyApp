import 'package:flutter/material.dart';
import 'package:tim_archy_app/helper.dart';
import 'package:tim_archy_app/pages/home.dart';

List<Widget> displayLogin(BuildContext context)
{
  return [
    makeFormSizedBox("Nom d'utilisateur", "Entrer votre nom d'utilisateur"),

    makeFormSizedBox("Mot de passe", "Enter votre mot de passe"),

    FractionallySizedBox(
      widthFactor: 0.55,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder : (context) => HomePage())
        ),
        child: makeCustomButton(Color(0xFF235784), 25.0, 5.0, 5.0, 25.0, "CONNEXION"),
      ),
    ),

    makeText("Mot de passe oublié ?", Color(0xFF40A8C4), 18, FontStyle.normal, FontWeight.bold),
  ];
}