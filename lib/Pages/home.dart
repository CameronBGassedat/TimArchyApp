import 'package:flutter/material.dart';
import 'package:tim_archy_app/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

bool isConnection = true;

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // Logo
            FractionallySizedBox(
              widthFactor: 0.75,
              child: Image.asset(
                'images/logo_max.png',
              ),
            ),

            // NavBar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                InkWell(
                  onTap: () => print("Hello Container"),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: const Text(
                      "Connexion",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () => print("Hello Container"),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    child: const Text(
                      "Inscription",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Column CAM
            /*Column(
                children : isConnection == true ? displayLogin() : displayRegister()
            ),*/

            // Column Login
            Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: [
                      makeText("Nom d'utilisateur", 26, FontWeight.bold),
                      makeTextField("Entrer votre nom d'utilisateur", Colors.blue),
                    ],
                  ),
                ),

                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: [
                      makeText("Mot de passe", 26, FontWeight.bold),
                      makeTextField("Enter votre mot de passe", Colors.blue),
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

            // Column Register
            Column(
              children: [
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                      children: [
                        makeText("Nom d'utilisateur", 26, FontWeight.bold),
                        makeTextField("Entrer votre nom d'utilisateur", Colors.blue),
                      ]
                  ),
                ),

                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: [
                      makeText("Adresse email", 26, FontWeight.bold),
                      makeTextField("Enter votre adresse email", Colors.blue),
                    ],
                  ),
                ),

                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Column(
                    children: [
                      makeText("Mot de passe", 26, FontWeight.bold),
                      makeTextField("Enter votre mot de passe", Colors.blue),
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
              ],
            ),
          ],
        ),
      ),
    );
  }

/*  List<Widget> displayLogin()
  {
    List<Widget> childrenLogin = const <Widget>[];

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
    List<Widget> childrenRegister = const <Widget>[];

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
  }*/
}