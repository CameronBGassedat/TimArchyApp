import 'dart:convert';


import 'package:flutter/material.dart';
import '../../../BusinessLogic/AirluxBloc.dart';
import 'package:http/http.dart' as http;

import 'package:timer_builder/timer_builder.dart';

const TEMPERATURE = "temperature";
const HUMIDITY= "humidity";

var sensorList = <Sensor>[];

class Sensor {
  String id;
  //int id;
  String name;
  String value;
  String capacity;

  Sensor(this.id, this.name, this.value, this.capacity);
}

List<Sensor> getSensorList() {
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
        itemBuilder: (BuildContext context, int index) {
          Sensor sensor = getSensorList()[index];
          print('SENSORVALUE: $sensor.value');
          return
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(selectIcon(sensor.capacity),
                              color: Color(0xFF40A8C4),
                              size: 40,
                ),

                title: Text('${sensor.id} ',
                  style: const TextStyle(fontSize: 20)),
                subtitle: Text(translate(sensor.capacity)),
                trailing: Text(addUnity(sensor.capacity, sensor.value), style: const TextStyle(fontSize: 25)),
              ),
            );
        },
      ),
    );
  });

  //airluxBloc.buildSensorsListView();
}

void getData() async {
  http.Response response =
      await http.get(Uri().resolve('http://10.31.38.171:3000/sensor'));
  if (response.statusCode == 200) {
    var sensors = json.decode(response.body);
    Map myMap = sensors;

    sensorList.clear();

    myMap.forEach((key, value) {
      List myList = value;
      /*
      print('$key : $value');
      print(value.runtimeType);
      print(value);
      print(myList[0]['name']);*/

      for (int i=0; i<myList.length ; i++){
        sensorList.add(Sensor(myList[i]['entityId'], myList[i]['entityId'], myList[i]['value'], myList[i]['capacity']));
      }
      //print(sensorList);
    });
  } else {
    print(response.statusCode);
  }
}

IconData? selectIcon(String capacity) {

  IconData? capacityIcon = null;

  switch(capacity.toLowerCase()) {
    case TEMPERATURE : {
      capacityIcon = Icons.thermostat;
      break;
    }
    case HUMIDITY : {
      capacityIcon = Icons.water_drop;
      break;
    }
  }
  return capacityIcon;
}


String addUnity(String capacity, String value) {

  switch(capacity.toLowerCase()) {
    case TEMPERATURE : {
      value = value + " °C";
      break;
    }
    case HUMIDITY : {
      value = value + " %";
      break;
    }
  }
  return value;
}

String translate(String capacity){
  switch(capacity.toLowerCase()) {
    case TEMPERATURE : {
      capacity = "Température";
      break;
    }
    case HUMIDITY : {
      capacity = "Humidité";
      break;
    }
  }
  return capacity;
}