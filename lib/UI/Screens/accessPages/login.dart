import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/pages/homePage.dart';
import 'package:tim_archy_app/BusinessLogic/Authentication.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;

Widget displayLogin(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  final AuthenticationAirlux _auth = new AuthenticationAirlux();
  String _email = "";
  String _password = "";

  String ipValue = "";

  return SingleChildScrollView(
    child: Column(children: [

      Padding(
        padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: TextField(
            onChanged: (value) {
              _email = value;
              globals.setUserEmail(value);
              print(_email);
            },
            decoration: InputDecoration(
              hintText: "Entrez votre adresse mail",
              hintStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.0),
                borderSide: const BorderSide(width: 2.0, color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.0),
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            onChanged: (value) {
              _password = value;
              globals.setUserPwd(value);
              print(_password);
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
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 0.025 * screenHeight),
        child: FractionallySizedBox(
          widthFactor: 0.55,
          child: InkWell(
            onTap: () async => {
              await _auth.login(_email, _password).then((value) async {
                print(value);
                final Map<String, dynamic> parsedData =
                    await jsonDecode(value.toString());
                final bool authenticated = parsedData['authenticated'];
                final String data = parsedData['data'];
                if (authenticated) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Email ou mot de passe incorrect'),
                    backgroundColor: Colors.blueGrey,
                  ));
                }
              })
            },
            child: makeCustomButton(
                Colors.white, 30.0, 10.0, 10.0, 30.0, "CONNEXION"),
          ),
        ),
      ),
      InkWell(
        child: makeText("Mot de passe oublié ?", Colors.grey, 18,
            FontStyle.normal, FontWeight.bold),
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(

              child: Container(
                child: Container(

                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF00B8D4),
                            Color(0xFF84FFFF),
                          ]
                      )
                  ),
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
                        Colors.white54,
                        15,
                        FontStyle.normal,
                        FontWeight.bold,
                        txtAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                      child: TextField(
                        onChanged: (value){
                          ipValue=value;
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        child: TextButton(
                          child: Text("Valider"),
                          onPressed: (){
                            globals.setIp(ipValue);
                            print(globals.ip);
                          },
                        )
                       ),
                    ),


                  ],
                ),
              ),
              ),
            ),
            ),
          );
        },
      ),





    ]),
  );
}
