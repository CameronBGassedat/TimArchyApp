import 'package:flutter/material.dart';
import 'package:tim_archy_app/UI/Helpers/helper.dart';

Widget buildingsContainer() {
  return
    Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children :[
          Icon(Icons.warning_amber, color: Color(0xFF40A8C4) ,size: 125,),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: makeText("Désolé, cette fonctionnalitée est encore en développement", Colors.black, 25, FontStyle.normal, FontWeight.bold, txtAlign: TextAlign.center),
          )
        ]
      ),
    );
}