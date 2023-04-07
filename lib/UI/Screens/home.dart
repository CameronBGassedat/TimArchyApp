import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import '../../BusinessLogic/AirluxBloc.dart';
import 'homePages/buildings.dart';
import 'homePages/favorites.dart';
import 'homePages/scenarios.dart';
import 'homePages/sensors.dart';
import 'homePages/users.dart';

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
    //airluxBloc.addUser("", "", ""); work A ok
    bool isConnection = true;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 0.075*screenHeight,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => {this.index = index}),
        destinations: [
          makeIndex("images/blank_heart.png", 30, index == 0 ? Colors.black : Colors.grey, "Favoris"),
          makeIndex("images/sensors.png", 33, index == 1 ? Colors.black : Colors.grey, "Capteurs"),
          makeIndex("images/scenarios.png", 25, index == 2 ? Colors.black : Colors.grey, "Scenarios"),
          makeIndex("images/users.png", 27, index == 3 ? Colors.black : Colors.grey, "Utilisateurs"),
          makeIndex("images/buildings.png", 30, index == 4 ? Colors.black : Colors.grey, "Batiments"),
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
                  Image.asset(
                    "images/logo_min.png",
                    height: 0.06 * screenHeight
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 0.09 * screenHeight,
                    child: makeText(title[index], Colors.black, index == 3 ? 38 : 42, FontStyle.italic, FontWeight.w900)
                  ),
                  Image.asset(
                    "images/user_menu.png",
                    height: 0.05 * screenHeight,
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
