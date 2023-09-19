import 'package:flutter/material.dart';
import 'package:tim_archy_app/BusinessLogic/AirluxBloc.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';
import 'package:tim_archy_app/UI/Screens/accessPages/login.dart';
import 'package:tim_archy_app/UI/Screens/accessPages/register.dart';

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

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF00B8D4),
                Color(0xFF84FFFF),
              ]
            )
          ),
          child: Center(
            child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle
                ),
                child: const Icon(Icons.home_outlined, color: Colors.white, size: 100,),
                ),
              
              SizedBox(height: 16.0),
              RichText(
                  text: TextSpan(text: "Airlux",
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      color: Colors.white,
                    )
                  ),
              ),
              SizedBox(height: 30.0),

              Padding(
                padding: EdgeInsets.only(bottom: 0.05 * screenHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isConnection = true;
                        });
                      },
                      child: makeNavBarContainer(0.0, 0.02 * screenWidth, "Connexion", isConnection == true ? Colors.white : Colors.grey),
                    ),

                    InkWell(
                      onTap: () {
                        setState(() {
                          isConnection = false;
                        });
                      },
                      child: makeNavBarContainer(0.02 * screenWidth, 0.0, "Inscription", isConnection == true ? Colors.grey : Colors.white),
                    ),
                  ],
                ),
              ),

              Flexible(
                  child : isConnection == true ? displayLogin(context) : displayRegister(context)
              ),
            ],
          ),
        ),
        /**/
      ),
      ),
    );
  }
}