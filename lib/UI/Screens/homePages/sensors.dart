import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../BusinessLogic/AirluxBloc.dart';
import 'package:http/http.dart' as http;

import 'package:timer_builder/timer_builder.dart';

var sensorList = <Sensor>[];

class Sensor {
  String id;
  //int id;
  String name;
  String value;
  String capacity;


  Sensor(this.id, this.name, this.value, this.capacity);
}

List<Sensor> getSensorList(){
  getData();
  return sensorList;
}

Widget sensorsContainer(AirluxBloc airluxBloc) {
  getData();
  return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: getSensorList().length,
        itemBuilder: (BuildContext context, int index){
          Sensor sensor = getSensorList()[index];
          return
            Card(
              elevation: 5,
              child: Column(
                  children : [
                    Text("ID : ${sensor.id}"), //${sensor.id}
                    Text("Sensor Type : ${sensor.name}"),
                    Text("Value : ${sensor.value}"),
                    Text("Capacity : ${sensor.capacity}"),
                  ]
              ),
            );
        },
      ),
    );

  });

    //airluxBloc.buildSensorsListView();
}

void getData() async{
  http.Response response = await http.get(Uri().resolve('http://10.31.38.171:3000/sensor'));
  if (response.statusCode == 200) {
    var sensors = json.decode(response.body);
    Map myMap = sensors;

    //List<String>? dataList = sensors != null ? List.from(sensors) : null;

    //print("RESULT");
    //print(dataList);

    sensorList.clear();

    myMap.forEach((key, value){
      List myList = value;
      print('$key : $value');
      print(value.runtimeType);
      print(value);
      print(myList[0]['name']);

      for (int i=0; i<myList.length ; i++){

        sensorList.add(Sensor(myList[i]['entityId'], myList[i]['name'], myList[i]['value'], myList[i]['capacity']));
      }
      print(sensorList);
    });
  } else {
    print(response.statusCode);
  }
}
