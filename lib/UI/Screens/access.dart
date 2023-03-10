import 'package:flutter/material.dart';
import 'package:tim_archy_app/Data/Repositories/AirLuxRepository.dart';
import 'package:tim_archy_app/helper.dart';
import 'package:tim_archy_app/UI/Screens/accessPages/login.dart';
import 'package:tim_archy_app/UI/Screens/accessPages/register.dart';
import '../../BusinessLogic/AirluxBloc.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});
  @override
  AccessPageState createState() => AccessPageState();
}

class AccessPageState extends State<AccessPage> {
  bool isConnection = true;
  late AirluxBloc airluxBloc;

  @override
  void initState() {
    airluxBloc = AirluxBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // TESTING
    //airluxBloc.LoadSensors();

    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0.05*screenHeight, bottom: 0.05*screenHeight),
                child: Image.asset(
                  'images/logo_max.png',
                  width: 0.8*screenWidth,
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
                      child: makeNavBarContainer(0.0, 0.02*screenWidth, "Connexion", isConnection == true ? Colors.black : Colors.grey),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          isConnection = false;
                        });
                      },
                      child: makeNavBarContainer(0.02*screenWidth, 0.0, "Inscription", isConnection == true ? Colors.grey : Colors.black),
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
}