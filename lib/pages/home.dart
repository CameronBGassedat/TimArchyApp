import 'package:flutter/material.dart';
import 'package:tim_archy_app/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
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
              padding: EdgeInsets.only(left: 0.05*screenWidth, top: 0.05*screenWidth, right: 0.05*screenWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("images/logo_min.png", height: 0.06*screenHeight),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 0.09*screenHeight,
                    child: const Text(
                      "CAPTEURS",
                      style: TextStyle(
                        fontSize: 42,
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
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Card(
                    child: Text("Rain"),
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
