import 'package:flutter/material.dart';
import 'package:tim_archy_app/BusinessLogic/AirluxBloc.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import '../home.dart';

Widget displayRegister(BuildContext context, AirluxBloc airluxBloc)
{
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  return
    Column(
      children: [
        makeFormSizedBox("Nom d'utilisateur", "Entrer votre nom d'utilisateur", userNameController),

        makeFormSizedBox("Adresse email", "Enter votre mot de passe", passwordController),

        makeFormSizedBox("Enter votre adresse email", "Enter votre mot de passe", emailController),

        FractionallySizedBox(
          widthFactor: 0.55,
          child: InkWell(
            onTap: () => () => checkInputtedInformation(
                context,
                airluxBloc,
                userNameController,
                emailController,
                passwordController
            ),
            child: makeCustomButton(const Color(0xFF40A8C4), 5.0, 25.0, 25.0, 5.0, "INSCRIPTION"),
          ),
        ),
      ],
    );
}


void checkInputtedInformation(
    BuildContext context, AirluxBloc airluxBloc, TextEditingController userNameController,
    TextEditingController emailController, TextEditingController passwordController
    )
{
  print("Name:${Text(userNameController.text)}");
  print("email:${Text(emailController.text)}");
  print("passsword:${Text(passwordController.text)}");

  bool isUserFound = false;
  airluxBloc.addUser(
      Text(userNameController.text).toString() ?? "",
      Text(emailController.text).toString() ?? "",
      Text(passwordController.text).toString() ?? "",
  );
  if (isUserFound == true) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder : (context) => HomePage()
        )
    );
  }
}