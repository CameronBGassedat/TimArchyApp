import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Entrer votre nom d'utilisateur",
                        enabledBorder : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
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
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter votre mot de passe",
                        enabledBorder : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              FractionallySizedBox(
                widthFactor: 0.55,
                child: InkWell(
                  onTap: () => print("Hello Container"),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFF235784),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(25.0)
                      ),
                    ),
                    child: const Text(
                      "CONNEXION",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const FractionallySizedBox(
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF40A8C4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
