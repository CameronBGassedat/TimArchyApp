import 'package:flutter/material.dart';
import 'package:tim_archy_app/BusinessLogic/AirluxBloc.dart';
// import 'package:tim_archy_app/Data/my_globals.dart' as globals;
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/homePages/buildings.dart';
import 'package:tim_archy_app/UI/Screens/homePages/favorites.dart';
import 'package:tim_archy_app/UI/Screens/homePages/scenarios.dart';
import 'package:tim_archy_app/UI/Screens/homePages/sensors.dart';
import 'package:tim_archy_app/UI/Screens/homePages/user_menu.dart';
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
    "UTILISATEURS",
    "BATIMENTS",
  ];

  @override
  void initState() {
    airluxBloc = AirluxBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 0.075 * screenHeight,
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
                padding: EdgeInsets.all(0.05 * screenWidth),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    makeImage("logo_min.png", 0.06 * screenHeight),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 0.09 * screenHeight,
                      child: makeText(title[index], Colors.black, 38, FontStyle.italic, FontWeight.w900)
                    ),
                    InkWell(
                      child: makeImage("user_menu.png", 0.06 * screenHeight),
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.grey[350],
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
                          context: context,
                          builder: (BuildContext context) {
                            return userMenuContainer(screenHeight, screenWidth, context);
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
        floatingActionButton: index == 1 ? FloatingActionButton(
          backgroundColor: const Color(0xFF70bed3),
          child: makeImage("sensors_add.png", screenHeight),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DevicesScreen())
          ),
        ) : null,
      ),
    );
  }
}
