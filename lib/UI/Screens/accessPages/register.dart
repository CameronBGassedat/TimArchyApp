import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import '../home.dart';

Widget displayRegister(BuildContext context)
{

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  return
    Column(
      children: [
        makeFormSizedBox("Nom d'utilisateur", "Entrer votre nom d'utilisateur", userNameController),

        makeFormSizedBox("Adresse email", "Enter votre mot de passe", passwordController),

        makeFormSizedBox("Enter votre adresse email", "Enter votre mot de passe", emailController),

        FractionallySizedBox(
          widthFactor: 0.55,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder : (context) => HomePage())
            ),
            child: makeCustomButton(const Color(0xFF40A8C4), 5.0, 25.0, 25.0, 5.0, "INSCRIPTION"),
          ),
        ),
      ],
    );
}