
import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Screens/access.dart';
import 'package:tim_archy_app/UI/Screens/home.dart';
import 'package:flutter/material.dart';
import 'UI/pages/buildingPage.dart';
import 'UI/pages/favoritePage.dart';
import 'UI/pages/scenarioPage.dart';
import 'UI/pages/sensorPage.dart';
import 'UI/pages/userPage.dart';

/*
void main() {
  runApp(const MyApp());
}*/

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccessPage(),


    );
  }
}
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccessPage(),


      );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'UI/pages/buildingPage.dart';
import 'UI/pages/favoritePage.dart';
import 'UI/pages/scenarioPage.dart';
import 'UI/pages/sensorPage.dart';
import 'UI/pages/userPage.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

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
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Color(0xFF40A8C4),),
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
            //SizedBox(height: 100,)
           ],
        ),

        body: _pages[_selectedIndex],
        /*
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Saisir un texte'),
                  content: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Entrez du texte',
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Annuler'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Ajouter'),
                      onPressed: () async {
                        final name = nameController.text; // Récupérez le texte de la boîte de dialogue

                        // Créez un objet JSON avec le nom et envoyez-le dans la requête POST
                        final postData = {
                          'name': name,
                          'sensorList': ['capteur1', 'capteur2'], // Remplacez par la liste de capteurs de votre élément
                        };

                        final jsonBody = jsonEncode(postData);

                        print("response");
                        http.Response response1 =
                        await http.get(Uri().resolve('http://192.168.1.89:3000/room'));
                        print("eeeeeeeeeee");
                        print(response1);

                        final url = Uri.parse('http://192.168.1.89:3000/room'); // Remplacez par l'URL de votre endpoint de création d'élément
useremail': globals.userEmail.trim(),
                        print("~~~~~~~~~~~ URL ");
                        print(url);

                        final response = await http.post(
                          url,
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonBody,
                        );

                        print("response.statusCode");
                        print(response.statusCode);

                        if (response.statusCode == 201) {
                          // La création de l'élément a réussi
                          print('Élément ajouté avec succès.');
                        } else {
                          // La création de l'élément a échoué
                          print('Erreur lors de l\'ajout de l\'élément. Code de réponse : ${response.statusCode}');
                        }

                        Navigator.of(context).pop(); // Fermez la boîte de dialogue après l'ajout de l'élément
                      },
                    ),
                  ],
                );
              },
            );
          },

          child: Icon(Icons.add), // Icône à afficher sur le bouton
          tooltip: 'Ajouter', // Texte d'info-bulle
        ),*/
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
}*/

