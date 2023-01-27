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

    bool isConnection = true;

    return Scaffold(
      body: Center(
        child: Column(

          children: [
            // Logo
            FractionallySizedBox(
              widthFactor: 0.80,
              child : Padding(
                padding: EdgeInsets.only(top: 0.1*screenHeight, bottom: 0.05*screenHeight),
                child: Image.asset(
                  'images/logo_max.png',
                ),
              ),
            ),

            // NavBar
            Container(
              padding: EdgeInsets.only(bottom: 0.05*screenHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  InkWell(
                    onTap: () => {isConnection = true, print(isConnection)}, // isConnection = true
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      padding: EdgeInsets.only(right: 0.02*screenWidth),
                      child: Text(
                        "Connexion",
                        style: TextStyle(
                          fontSize: 26,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: isConnection == true ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () => {isConnection = false, print(isConnection)}, // isConnection = false
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      padding: EdgeInsets.only(left: 0.02*screenWidth),
                      child: Text(
                        "Inscription",
                        style: TextStyle(
                          fontSize: 26,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: isConnection == true ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Column(
                children : isConnection == true ? displayLogin() : displayRegister()
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> displayLogin()
  {
    List<Widget> childrenLogin = <Widget>[];

    // Username
    childrenLogin.add(
      FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            makeText("Nom d'utilisateur", 26, FontWeight.bold),
            makeTextField("Entrer votre nom d'utilisateur", Colors.blue),
          ],
        ),
      ),
    );

    // Password
    childrenLogin.add(
      FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            makeText("Mot de passe", 26, FontWeight.bold),
            makeTextField("Enter votre mot de passe", Colors.blue),
          ],
        ),
      ),
    );

    // Button
    childrenLogin.add(
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
    );

    // Forgot Password
    childrenLogin.add(
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
    );

    return childrenLogin;
  }

  List<Widget> displayRegister()
  {
    List<Widget> childrenRegister = <Widget>[];

    // Username
    childrenRegister.add(
      FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
            children: [
              makeText("Nom d'utilisateur", 26, FontWeight.bold),
              makeTextField("Entrer votre nom d'utilisateur", Colors.blue),
            ]
        ),
      ),
    );

    // Email
    childrenRegister.add(
      FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            makeText("Adresse email", 26, FontWeight.bold),
            makeTextField("Enter votre adresse email", Colors.blue),
          ],
        ),
      ),
    );

    // Password
    childrenRegister.add(
      FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            makeText("Mot de passe", 26, FontWeight.bold),
            makeTextField("Enter votre mot de passe", Colors.blue),
          ],
        ),
      ),
    );

    // Button
    childrenRegister.add(
      FractionallySizedBox(
        widthFactor: 0.55,
        child: InkWell(
          onTap: () => print("Hello Container"),
          child: Container(
            alignment: Alignment.center,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF40A8C4),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(5.0)
              ),
            ),
            child: const Text(
              "INSCRIPTION",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    return childrenRegister;
  }
}