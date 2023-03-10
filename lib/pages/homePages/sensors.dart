import 'package:flutter/material.dart';
import 'dart:math';

/* ========= TEMPORARY =========== */
String name = "";
randomName(){
  var random = Random();
  var sensorList = ["Portail", "Porte", "Volet", "Lumière", "Intensité Lumineuse", "Température", "Humidité"];
  name = sensorList[random.nextInt(sensorList.length)];
  return name;
}

bool randomBool() {
  var random = Random();
  bool boolData = random.nextBool();
  return boolData;
}
double randomDouble() {
  var random = Random();
  String stringData = (random.nextDouble()*100).toStringAsFixed(2);
  double doubleData = double.parse(stringData);
  return doubleData;
}
randomData(){
  switch (name){
    case "Portail" :
    case "Porte" :
    case "Volet" :
    case "Lumière" :
      bool boolData = randomBool();
      return boolData.toString();

    case "Intensité Lumineuse" :
    case "Température" :
    case "Humidité" :
      double doubleData = randomDouble();
      return doubleData.toString();

  default:
      print("Oups data missing");
  }
}

randomRoomId(){
  var random = Random();
  var roomID = random.nextInt(10);
  return roomID;
}

/* ========= TEMPORARY =========== */
class Sensor {
  //int id;
  String name;
  String data;
  int roomID;

  Sensor(/*this.id,*/ this.name, this.data, this.roomID);
}

List<Sensor> sensorList(){
  var sensorList = <Sensor>[];
  for (int i = 0; i < 10; i++) {
    sensorList.add(Sensor(randomName(), randomData(), randomRoomId()));
  }
  return sensorList;
}

Widget sensorsContainer() {
  return
    Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: sensorList().length,
        itemBuilder: (BuildContext context, int index){
          Sensor sensor = sensorList()[index];
          return
            Card(
              elevation: 5,
              child: Column(
                children : [
                  Text("ID : ${index+1}"), //${sensor.id}
                  Text("Sensor Type : ${sensor.name}"),
                  Text("Value : ${sensor.data}"),
                  Text("RoomID : ${sensor.roomID}"),
                ]
              ),
            );
        },
      ),
    );
}

/*List<Card> makeCards(List<Sensor> sensorList)
{

   var cardsList = List<Card>();
   return cardsList;
}

Card makeTwoStatesCard()
{
  return new Card();
}

Card makeSliderCard()
{
  return new Card();
}*/
