import 'package:flutter/material.dart';
import 'package:tim_archy_app/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    int index = 1;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        //onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(
                icon: Image.asset(
                  "images/blank_heart.png",
                  height: 30,
            ),
            label: "Favoris",
          ),
          NavigationDestination(
            icon: Image.asset(
              "images/sensors.png",
              height: 33,
            ),
            label: "Capteurs",
          ),
          NavigationDestination(
            icon: Image.asset(
              "images/scenarios.png",
              height: 25,
            ),
            label: "Scenarios",
          ),
          NavigationDestination(
            icon: Image.asset(
              "images/users.png",
              height: 27,
            ),
            label: "Utilisateurs",
          ),
          NavigationDestination(
            icon: Image.asset(
              "images/buildings.png",
              height: 28,
            ),
            label: "Batiments",
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.05*screenWidth, top: 0.05*screenWidth, right: 0.05*screenWidth),
              child: Row(
                children: [
                  Image.asset("images/logo_min.png", height: 0.07*screenHeight),
                  Text(
                    "CAPTEURS",
                    style: TextStyle(
                      fontSize: 42,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Image.asset("images/user_menu.png", height: 0.06*screenHeight,),
                ],
              ),
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Card(
                    child: Text("Rain"),
                  ),
                  Card(
                    child: Text("Thunder"),
                  ),
                  Card(
                    child: Text("Snow"),
                  ),
                  Card(
                    child: Text("Music"),
                  ),
                  Card(
                    child: Text("Ta"),
                  ),
                  Card(
                    child: Text("Maman"),
                  ),
                  Card(
                    child: Text("Cam"),
                  ),
                  Card(
                    child: Text("T'es beau"),
                  ),
                  Card(
                    child: Text("Ce bg"),
                  ),
                  Card(
                    child: Text("Quel homme"),
                  ),
                  Card(
                    child: Text("Jsuis pas sérieux dans ce que je dis"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
