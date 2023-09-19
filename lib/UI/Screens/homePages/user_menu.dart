import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:http/http.dart' as http;

Widget userMenuContainer(screenHeight, screenWidth, context) {
  String _ssid = "";
  String _ssidPassword = "";
  String _ip = "";
  String _bugTitle = "";
  String? _bugType = "";
  String _bugDesc = "";
  int count = 0;

  return SizedBox(
    height: 0.30 * screenHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0.06 * screenWidth, right: 0.06 * screenWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children: [
                    makeImage("user_menu.png", 0.03 * screenHeight),
                    Padding(
                        padding: EdgeInsets.only(left: 0.03 * screenWidth),
                        child: makeText("Cameron", Colors.black, 24, FontStyle.italic, FontWeight.w900)
                    ),
                  ]
              ),
              makeText("Administrateur", Colors.black, 20, FontStyle.italic, FontWeight.normal),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.06 * screenWidth, right: 0.06 * screenWidth),
          child: InkWell(
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
                            child: makeFormSizedBox("Nom du réseau", "Entrer le nom du réseau", fTxtFdOnChanged: (value) {_ssid = value;})
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                            child: makeFormSizedBox("Mot de passe", "Entrer le mot de passe du réseau", fTxtFdOnChanged: (value) {_ssidPassword = value;})
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 0.06 * screenHeight, width: 0.06 * screenHeight),
                            ElevatedButton(
                              onPressed: () {
                                globals.setSsid(_ssid);
                                globals.setPassword(_ssidPassword);
                                Navigator.of(context).pop();
                              },
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Color(0xFF40A8C4)),
                                padding: MaterialStatePropertyAll(EdgeInsets.only(top: 10.0, right: 15.0, bottom: 10.0, left: 15.0)),
                              ),
                              child: makeText("Valider", Colors.white, 24, FontStyle.normal, FontWeight.bold),
                            ),
                            InkWell(
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
                                              child: makeFormSizedBox("Adresse IP", "Entrer l'adresse IP", fTxtFdOnChanged: (value) {_ip = value;})
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              globals.setIp(_ip);
                                              Navigator.of(context).pop();
                                            },
                                            style: const ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll(Color(0xFF40A8C4)),
                                              padding: MaterialStatePropertyAll(EdgeInsets.only(top: 10.0, right: 15.0, bottom: 10.0, left: 15.0)),
                                            ),
                                            child: makeText("Valider", Colors.white, 24, FontStyle.normal, FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(height: 0.06 * screenHeight, width: 0.06 * screenHeight),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Row(
                children: [
                  makeImage("settings.png", 0.03 * screenHeight),
                  Padding(
                      padding: EdgeInsets.only(left: 0.03 * screenWidth),
                      child: makeText("Paramètres", Colors.black, 24, FontStyle.italic, FontWeight.w900)
                  ),
                ]
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.06 * screenWidth, right: 0.06 * screenWidth),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                            child: makeText("Décrivez nous votre problème", Colors.black, 26, FontStyle.normal, FontWeight.bold, txtAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                            child: makeFormSizedBox("Titre", "Donnez un titre à votre rapport", fTxtFdOnChanged: (value) {_bugTitle = value;}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                            child: Column(
                              children: [
                                makeText("Type d'erreur", Colors.black, 26, FontStyle.normal, FontWeight.bold),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 30),
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text("Sélectionnez votre type d'erreur"),
                                      isExpanded: true,
                                      icon: Icon(Icons.arrow_drop_down, size: 30, color: Colors.black,),
                                      items: const [
                                        DropdownMenuItem(value:"5a5c6b2ffdffc6afb9e212a0", child: Text("Problèmes visuels")),
                                        DropdownMenuItem(value:"5fa1928483a7d601361f58d2", child: Text("Problèmes fonctionnel")),
                                        DropdownMenuItem(value:"6349535a47872c003fcafdc2", child: Text("Problèmes d'appairage")),
                                        DropdownMenuItem(value:"61825e8ed9c64b55e510512a", child: Text("Problème de gestion droits")),
                                        DropdownMenuItem(value:"606c31754e92d6609dc9a654", child: Text("Problème de gestion des capteurs")),
                                      ],
                                      onChanged: (value) {
                                        _bugType = value;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                            child: makeFormSizedBox("Description", "Décrivez nous votre problème et comment l'avez vous eu", txtMaxLines: null, fTxtFdOnChanged: (value) {_bugDesc = value;}),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              try {
                                http.post(
                                  Uri.parse("https://api.trello.com/1/cards?"),
                                  body: {
                                    "key": "e79a8e9dcae5d0b17b061d2d0b34b134",
                                    "token": "7872ded1ed3696fa672394599a254e0c8a0b48f5dd44fae89d0b8d2a1aa42d70",
                                    "idList": "6380e352e58d4b006e6fde1c",
                                    "name": _bugTitle,
                                    "desc": _bugDesc,
                                    "pos": "top",
                                    "start": DateFormat("dd-MM-yyyy").format(DateTime.now()),
                                    "idMembers": _bugType,
                                    "idLabels": "6380e318bab42989812c4a93",
                                  }
                                );
                                Navigator.of(context).pop();
                              } catch(e){
                                print(e);
                              }
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xFF40A8C4)),
                              padding: MaterialStatePropertyAll(EdgeInsets.only(top: 10.0, right: 15.0, bottom: 10.0, left: 15.0)),
                            ),
                            child: makeText("Valider", Colors.white, 24, FontStyle.normal, FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Row(children: [
              makeImage("bug_report.png", 0.03 * screenHeight),
              Padding(
                  padding: EdgeInsets.only(left: 0.03 * screenWidth),
                  child: makeText("Rapport de bug", Colors.black, 24, FontStyle.italic, FontWeight.w900)
              ),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.06 * screenWidth, right: 0.06 * screenWidth),
          child: InkWell(
            onTap: () {
              Navigator.of(context).popUntil((_) => count++ >= 2);
            },
            child: Row(
                children: [
                  makeImage("disconnect.png", 0.03 * screenHeight),
                  Padding(
                      padding: EdgeInsets.only(left: 0.03 * screenWidth),
                      child: makeText("Déconnexion", Colors.black, 24, FontStyle.italic, FontWeight.w900)
                  ),
                ]
            ),
          ),
        ),
      ],
    ),
  );
}