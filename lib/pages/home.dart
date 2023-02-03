import 'package:flutter/material.dart';
import 'package:tim_archy_app/helper.dart';

import '../api/api.dart';

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

    bool isConnection = true;
    var body = {
      "type" : "User",
      "id" : "1",
      "name" : "myname",
      "email" : "myemail"
    };
    //getCall('/get_users');
    postCall('/add', body);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NavigationBar(
              destinations: [
                NavigationDestination(
                  icon: Image.asset("images/blank_heart.png"),
                  label: "Favoris",
                ),
                NavigationDestination(
                  icon: Image.asset("images/sensors.png"),
                  label: 'Capteurs',
                ),
                NavigationDestination(
                  icon: Image.asset("images/scenarios.png"),
                  label: 'Scenarios',
                ),
                NavigationDestination(
                  icon: Image.asset("images/users.png"),
                  label: 'Utilisateurs',
                ),
                NavigationDestination(
                  icon: Image.asset("images/buildings.png"),
                  label: 'Batiments',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
