import 'package:flutter/material.dart';
import 'package:tim_archy_app/BusinessLogic/AirluxBloc.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/home.dart';

Widget displayLogin(BuildContext context, AirluxBloc airluxBloc)
{
  final screenHeight = MediaQuery.of(context).size.height;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  // To get text in controller : Text(myController.text)

  /*
  Navigator.of(context).push(
      MaterialPageRoute(
          builder : (context) => HomePage()
      )
  ),
  */

  return
    Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
          child: makeFormSizedBox("Nom d'utilisateur", "Entrer votre nom d'utilisateur", userNameController),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
          child: makeFormSizedBox("Mot de passe", "Enter votre mot de passe", passwordController),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
          child: FractionallySizedBox(
            widthFactor: 0.55,
            child: InkWell(
              onTap: () => checkInputtedInformation(context, airluxBloc, userNameController),
              child: makeCustomButton(const Color(0xFF235784), 25.0, 5.0, 5.0, 25.0, "CONNEXION"),
            ),
          ),
        ),

        makeText("Mot de passe oublié ?", Color(0xFF40A8C4), 18, FontStyle.normal, FontWeight.bold),
      ]
    );
}

void checkInputtedInformation(BuildContext context, AirluxBloc airluxBloc, TextEditingController userNameController)
{
  bool isUserFound = false;
  airluxBloc.loadSingleUser(
      Text(userNameController.text).toString()
  );
  if (isUserFound == true) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder : (context) => HomePage()
        )
    );
  }
}
