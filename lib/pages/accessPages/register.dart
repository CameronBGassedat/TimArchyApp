import 'package:flutter/material.dart';
import 'package:tim_archy_app/helper.dart';

List<Widget> displayRegister()
{
  return [
    makeTextFieldSizedBox("Nom d'utilisateur", "Entrer votre nom d'utilisateur"),

    makeTextFieldSizedBox("Adresse email", "Enter votre mot de passe"),

    makeTextFieldSizedBox("Enter votre adresse email", "Enter votre mot de passe"),

    FractionallySizedBox(
      widthFactor: 0.55,
      child: InkWell(
        onTap: () => print("Hello Inscription"),
        child: makeCustomButton(Color(0xFF40A8C4), 5.0, 25.0, 25.0, 5.0, "INSCRIPTION"),
      ),
    ),
  ];
}