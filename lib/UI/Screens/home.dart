import 'package:flutter/material.dart';
import 'package:tim_archy_app/BusinessLogic/AirluxBloc.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/homePages/buildings.dart';
import 'package:tim_archy_app/UI/Screens/homePages/favorites.dart';
import 'package:tim_archy_app/UI/Screens/homePages/scenarios.dart';
import 'package:tim_archy_app/UI/Screens/homePages/sensors.dart';
import 'package:tim_archy_app/UI/Screens/homePages/users.dart';
import 'package:tim_archy_app/UI/Screens/pairPages/device_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;
  late AirluxBloc airluxBloc;
  late List<Widget> pages = [
    favoritesContainer(),
    sensorsContainer(airluxBloc),
    scenariosContainer(),
    usersContainer(),
    buildingsContainer(),
  ];
  final List<String> title = [
    "FAVORIS",
    "CAPTEURS",
    "SCENARIOS",
    "UTIILISATEURS",
    "BATIMENTS",
  ];
  String ipValue = '';
  String dropdownValue = "";
  int count = 0;

  @override
  void initState() {
    airluxBloc = AirluxBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 0.075 * screenHeight,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => {this.index = index}),
        destinations: [
          makeIndex("blank_heart.png", 30,
              index == 0 ? Colors.black : Colors.grey, "Favoris"),
          makeIndex("sensors.png", 33, index == 1 ? Colors.black : Colors.grey,
              "Capteurs"),
          makeIndex("scenarios.png", 25,
              index == 2 ? Colors.black : Colors.grey, "Scenarios"),
          makeIndex("users.png", 27, index == 3 ? Colors.black : Colors.grey,
              "Utilisateurs"),
          makeIndex("buildings.png", 30,
              index == 4 ? Colors.black : Colors.grey, "Batiments"),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0.05 * screenWidth),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  makeImage("logo_min.png", 0.06 * screenHeight),
                  Container(
                      alignment: Alignment.bottomCenter,
                      height: 0.09 * screenHeight,
                      child: makeText(
                          title[index],
                          Colors.black,
                          index == 3 ? 38 : 42,
                          FontStyle.italic,
                          FontWeight.w900)),
                  InkWell(
                    child: makeImage("user_menu.png", 0.06 * screenHeight),
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.grey[350],
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 0.30 * screenHeight,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.06 * screenWidth,
                                        right: 0.06 * screenWidth),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          makeImage("user_menu.png",
                                              0.03 * screenHeight),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 0.03 * screenWidth),
                                              child: makeText(
                                                  "Cameron",
                                                  Colors.black,
                                                  24,
                                                  FontStyle.italic,
                                                  FontWeight.w900)),
                                        ]),
                                        makeText(
                                            "Administrateur",
                                            Colors.black,
                                            20,
                                            FontStyle.italic,
                                            FontWeight.normal),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.06 * screenWidth,
                                        right: 0.06 * screenWidth),
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
                                                        padding: EdgeInsets.only(bottom: 0.2 * screenHeight),
                                                        child: makeFormSizedBox("SSID", "Entrer le SSID du réseau")
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: 0.2 * screenHeight),
                                                        child: makeFormSizedBox("Mot de passe", "Entrer le mot de passe du réseau")
                                                      ),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            height: 0.06 * screenHeight,
                                                            width: 0.06 * screenHeight,
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              // SSID & Password Data
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
                                                                          child: makeText(
                                                                              "Adresse IP",
                                                                              Colors.black,
                                                                              20,
                                                                              FontStyle.normal,
                                                                              FontWeight.bold
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(bottom: 0.02 * screenHeight),
                                                                          child: TextField(
                                                                            onChanged: (value) {
                                                                              setState(() {
                                                                                ipValue = value;
                                                                              });
                                                                            },
                                                                            decoration: InputDecoration(
                                                                              hintText: "Entrer l'adresse IP",
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                borderSide: const BorderSide(width: 2.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        ElevatedButton(
                                                                          onPressed: () {
                                                                            globals.setIp(ipValue);
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
                                                            child: SizedBox(
                                                              height: 0.06 * screenHeight,
                                                              width: 0.06 * screenHeight,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                            ),
                                        );
                                      },
                                      child: Row(children: [
                                        makeImage(
                                            "settings.png", 0.03 * screenHeight),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 0.03 * screenWidth),
                                            child: makeText(
                                                "Paramètres",
                                                Colors.black,
                                                24,
                                                FontStyle.italic,
                                                FontWeight.w900)),
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.06 * screenWidth,
                                        right: 0.06 * screenWidth),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                                  title: makeText(
                                                      "Décrivez nous votre problème",
                                                      Colors.black,
                                                      20,
                                                      FontStyle.normal,
                                                      FontWeight.bold),
                                                  content: Column(
                                                    children: [
                                                      makeFormSizedBox("Titre",
                                                          "Donnez un titre à votre rapport"),
                                                      DropdownButton(
                                                        items: const [
                                                          DropdownMenuItem(value: "5a5c6b2ffdffc6afb9e212a0", child: Text("Problèmes visuels")),
                                                          DropdownMenuItem(value:"5fa1928483a7d601361f58d2", child: Text("Problèmes fonctionnel")),
                                                          DropdownMenuItem(value:"6349535a47872c003fcafdc2", child: Text("Problèmes d'appairage'")),
                                                          DropdownMenuItem(value:"61825e8ed9c64b55e510512a", child: Text("Problème de gestion droits")),
                                                          DropdownMenuItem(value:"606c31754e92d6609dc9a654", child: Text("Problème de gestion des capteurs")),
                                                        ],
                                                        value: dropdownValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            dropdownValue = value!;
                                                            print(dropdownValue);
                                                          });
                                                        },
                                                      ),
                                                      makeFormSizedBox(
                                                          "Description",
                                                          "Décrivez nous votre problème et comment l'avez vous eu"),
                                                    ],
                                                  ),
                                                  actions: const [
                                                    Text("Yes"),
                                                  ],
                                            ),
                                        );
                                      },
                                      child: Row(children: [
                                        makeImage("bug_report.png",
                                            0.03 * screenHeight),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 0.03 * screenWidth),
                                            child: makeText(
                                                "Rapport de bug",
                                                Colors.black,
                                                24,
                                                FontStyle.italic,
                                                FontWeight.w900)),
                                      ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0.06 * screenWidth,
                                        right: 0.06 * screenWidth),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).popUntil((_) => count++ >= 2);
                                      },
                                      child: Row(children: [
                                        makeImage("disconnect.png",
                                            0.03 * screenHeight),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 0.03 * screenWidth),
                                            child: makeText(
                                                "Déconnexion",
                                                Colors.black,
                                                24,
                                                FontStyle.italic,
                                                FontWeight.w900)),
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: pages[index],
            ),
          ],
        ),
      ),
      floatingActionButton: index == 1
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF70bed3),
              child: makeImage("sensors_add.png", screenHeight),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DevicesScreen())
              ),
            ) : null,
    );
  }
}
