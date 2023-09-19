import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/pages/scenarioPage.dart';
import 'package:tim_archy_app/UI/pages/sensorPage.dart';
import 'package:tim_archy_app/UI/pages/userPage.dart';
import 'package:tim_archy_app/UI/pages/buildingPage.dart';
import 'package:tim_archy_app/UI/pages/favoritePage.dart';
import 'package:tim_archy_app/Data/my_globals.dart' as globals;

import 'dart:convert';
import 'package:http/http.dart' as http;



void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String ssid = "";
  String mdp = "";

  final TextEditingController nameController = TextEditingController();

  final List<Widget> _pages = [
    FavoritePage(),
    SensorListPage(),
    ScenarioPage(),
    UserPage(),
    BuildingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Airlux",
            style: TextStyle(fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF40A8C4),),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(4.0),
              padding: EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        // Contenu de votre bottom sheet
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Column(
                            children: [

                              TextField(
                                  onChanged: (value) {
                                    ssid = value;
                                    print("ssid");
                                    print(ssid);
                                    },

                                    decoration: InputDecoration(
                                    labelText: 'SSID',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    ),
    ),
                                    TextField(
                                    onChanged: (value) {
                                      mdp = value;
                                      print("mdp");
                                      print(mdp);
                                    },

                                    decoration: InputDecoration(
                                    labelText: 'MDP',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                    ),
                                    TextButton(
                                    onPressed: (){
                                      globals.setSsid(ssid);
                                      globals.setPassword(mdp);
                                    },
                                  child: Text("Valider"),
                              ),

                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                  color: Color(0xFF40A8C4,
                  ),
                ),
              ),
            ),
          ],
        ),

        body: _pages[_selectedIndex],
        
        
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favoris',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sensors),
              label: 'Capteurs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined),
              label: 'Sénarios',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Utilisateurs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_city_outlined),
              label: 'Batiments',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          //0xFFCE93D8
          selectedItemColor: Color(0xFF40A8C4),
          unselectedItemColor: Colors.grey[400],
        ),
      ),
    );
  }
}
