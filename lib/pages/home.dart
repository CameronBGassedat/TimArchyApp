import 'package:flutter/material.dart';
import 'package:tim_archy_app/pages/homePages/buildings.dart';
import 'package:tim_archy_app/pages/homePages/favorites.dart';
import 'package:tim_archy_app/pages/homePages/scenarios.dart';
import 'package:tim_archy_app/pages/homePages/sensors.dart';
import 'package:tim_archy_app/pages/homePages/users.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 0;

  final List<String> title = [
    "FAVORIS",
    "CAPTEURS",
    "SCENARIOS",
    "UTIILISATEURS",
    "BATIMENTS",
  ];

  final List<Widget> pages = [
    favoritesContainer(),
    sensorsContainer(),
    scenariosContainer(),
    usersContainer(),
    buildingsContainer(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => {
          this.index = index,
        }),
        destinations: [
          NavigationDestination(
            icon: Image.asset(
              "images/blank_heart.png",
              height: 30,
              color: index == 0 ? Colors.black : Colors.grey,
            ),
            label: "Favoris",
          ),
          NavigationDestination(
            icon: Image.asset(
              "images/sensors.png",
              height: 33,
              color: index == 1 ? Colors.black : Colors.grey,
            ),
            label: "Capteurs",
          ),
          NavigationDestination(
            icon: Image.asset(
              "images/scenarios.png",
              height: 25,
              color: index == 2 ? Colors.black : Colors.grey,
            ),
            label: "Scenarios",
          ),
          NavigationDestination(
            icon: Image.asset(
              "images/users.png",
              height: 27,
              color: index == 3 ? Colors.black : Colors.grey,
            ),
            label: "Utilisateurs",
          ),
          NavigationDestination(
            icon: Image.asset(
              "images/buildings.png",
              height: 28,
              color: index == 4 ? Colors.black : Colors.grey,
            ),
            label: "Batiments",
          ),
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
                  Image.asset("images/logo_min.png", height: 0.06*screenHeight),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 0.09*screenHeight,
                    child: Text(
                      title[index],
                      style: TextStyle(
                        fontSize: index == 3 ? 40 : 42,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Image.asset("images/user_menu.png", height: 0.05*screenHeight,),
                ],
              ),
            ),
            Container(
              child: pages[index],
            )
          ],
        ),
      ),
    );
  }
}
