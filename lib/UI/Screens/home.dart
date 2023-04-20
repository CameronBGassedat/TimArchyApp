import 'package:flutter/material.dart';
import 'package:tim_archy_app/BusinessLogic/AirluxBloc.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/homePages/buildings.dart';
import 'package:tim_archy_app/UI/Screens/homePages/favorites.dart';
import 'package:tim_archy_app/UI/Screens/homePages/scenarios.dart';
import 'package:tim_archy_app/UI/Screens/homePages/sensors.dart';
import 'package:tim_archy_app/UI/Screens/homePages/users.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;
  late AirluxBloc airluxBloc;
  late List<Widget> pages = [];
  final List<String> title = [
    "FAVORIS",
    "CAPTEURS",
    "SCENARIOS",
    "UTIILISATEURS",
    "BATIMENTS",
  ];

  @override
  void initState() {
    airluxBloc = AirluxBloc();
    pages = [
      favoritesContainer(),
      sensorsContainer(airluxBloc),
      scenariosContainer(),
      usersContainer(),
      buildingsContainer(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 0.075*screenHeight,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => {this.index = index}),
        destinations: [
          makeIndex("blank_heart.png", 30, index == 0 ? Colors.black : Colors.grey, "Favoris"),
          makeIndex("sensors.png", 33, index == 1 ? Colors.black : Colors.grey, "Capteurs"),
          makeIndex("scenarios.png", 25, index == 2 ? Colors.black : Colors.grey, "Scenarios"),
          makeIndex("users.png", 27, index == 3 ? Colors.black : Colors.grey, "Utilisateurs"),
          makeIndex("buildings.png", 30, index == 4 ? Colors.black : Colors.grey, "Batiments"),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0.05*screenWidth),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  makeImage("logo_min.png", 0.06*screenHeight),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 0.09*screenHeight,
                    child: makeText(title[index], Colors.black, index == 3 ? 38 : 42, FontStyle.italic, FontWeight.w900)
                  ),
                  InkWell(
                    child: makeImage("user_menu.png", 0.05*screenHeight),
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[350],
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return
                            SizedBox(
                              height: 0.30*screenHeight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.06*screenWidth, right: 0.06*screenWidth),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            makeImage("user_menu.png", 0.03*screenHeight),
                                            Padding(
                                              padding: EdgeInsets.only(left: 0.03*screenWidth),
                                              child: makeText("Cameron", Colors.black, 24, FontStyle.italic, FontWeight.w900)
                                            ),
                                          ]
                                        ),
                                        makeText("Administrateur", Colors.black, 20, FontStyle.italic, FontWeight.normal),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.06*screenWidth, right: 0.06*screenWidth),
                                    child: Row(
                                      children: [
                                        makeImage("settings.png", 0.03*screenHeight),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0.03*screenWidth),
                                          child: makeText("Paramètres", Colors.black, 24, FontStyle.italic, FontWeight.w900)
                                        ),
                                      ]
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.06*screenWidth, right: 0.06*screenWidth),
                                    child: Row(
                                      children: [
                                        makeImage("bug_report.png", 0.03*screenHeight),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0.03*screenWidth),
                                          child: makeText("Rapport de bug", Colors.black, 24, FontStyle.italic, FontWeight.w900)
                                        ),
                                      ]
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 0.06*screenWidth, right: 0.06*screenWidth),
                                    child: Row(
                                        children: [
                                          makeImage("disconnect.png", 0.03*screenHeight),
                                          Padding(
                                              padding: EdgeInsets.only(left: 0.03*screenWidth),
                                              child: makeText("Disconnect", Colors.black, 24, FontStyle.italic, FontWeight.w900)
                                          ),
                                        ]
                                    ),
                                  ),
                                ],
                              ),
                            );
                        }
                      );
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
    );
  }
}
