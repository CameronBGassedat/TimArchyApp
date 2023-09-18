import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/home.dart';

Widget displayLogin(BuildContext context)
{
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return
    Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
          child: makeFormSizedBox("Adresse email", "Entrez votre adresse email"),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
          child: makeFormSizedBox("Mot de passe", "Entrez votre mot de passe"),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 0.025 * screenHeight),
          child: FractionallySizedBox(
            widthFactor: 0.55,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder : (context) => const HomePage())
              ),
              child: makeCustomButton(const Color(0xFF235784), 25.0, 5.0, 5.0, 25.0, "CONNEXION"),
            ),
          ),
        ),

        InkWell(
          child: makeText("Mot de passe oublié ?", const Color(0xFF40A8C4), 18, FontStyle.normal, FontWeight.bold),
          onTap : () {
            showDialog(
              context: context,
              builder: (_) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                        child: makeText(
                          "Renseignez votre adresse email pour recevoir un email de réinitialisation",
                          Colors.black,
                          20,
                          FontStyle.normal,
                          FontWeight.bold,
                          txtAlign : TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                        child: makeTextField("Entrer votre adresse email"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: makeCustomButton(const Color(0xFF40A8C4), 25.0, 25.0, 25.0, 25.0, "Valider", btnWidth : 0.3 * screenWidth),
                      )
                    ],
                  ),
                ),
              ),
            );
          },

        ),
      ]
    );
}