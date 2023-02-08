import 'package:flutter/material.dart';
import 'package:tim_archy_app/pages/accessPages/login.dart';
import 'package:tim_archy_app/pages/accessPages/register.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});
  @override
  AccessPageState createState() => AccessPageState();
}

class AccessPageState extends State<AccessPage> {
  bool isConnection = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.80,
                child: Padding(
                  padding: EdgeInsets.only(top: 0.05*screenHeight, bottom: 0.05*screenHeight),
                  child: Image.asset(
                    'images/logo_max.png',
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom: 0.05*screenHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isConnection = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        padding: EdgeInsets.only(right: 0.02*screenWidth),
                        child: Text(
                          "Connexion",
                          style: TextStyle(
                            color: isConnection == true ? Colors.black : Colors.grey,
                            fontSize: 26,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          isConnection = false;
                        });
                      },
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
      ),
    );
  }
}