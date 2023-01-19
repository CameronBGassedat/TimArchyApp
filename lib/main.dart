import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              FractionallySizedBox(
                widthFactor: 0.75,
                child: Image.asset(
                  'images/logo_max.png',
                ),
              ),

              FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  children: [
                    const Text(
                      "Nom d'utilisateur",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Entrer votre nom d'utilisateur",
                        enabledBorder : OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              FractionallySizedBox(
                widthFactor: 0.8,
                child: Column(
                  children: [
                    const Text(
                      "Mot de passe",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter votre mot de passe",
                        enabledBorder : OutlineInputBorder(
                          borderSide: const BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              FractionallySizedBox(
                child: ButtonBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
