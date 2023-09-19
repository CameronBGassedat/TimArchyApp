


import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Data/Models/SensorModel.dart';

import '../Data/my_globals.dart' as globals;

var sensorList = <Sensor>[];


List<Sensor> getAllSensors() {
  // appel Api
  getData();
  return sensorList;
}

List<String> getAllSensorById() {
  List<Sensor> sensorList = getAllSensors();
  // TODO: entryId et non id
  List<String> sensorIdList = sensorList.map((sensor) => sensor.id).toList();
  print("sensorIdList");
  print(sensorIdList);
  return sensorIdList;
}


void getData() async {

  final String url = "http://" + globals.ip + ":3000/sensor";
  
  http.Response response = await http.get(Uri().resolve(url));
  print("response");
  print(response);
  if (response.statusCode == 200) {
    var sensors = json.decode(response.body);
    print(sensors);
    Map myMap = sensors;
    sensorList.clear();

    myMap.forEach((key, value) {
      List myList = value;
      for (int i=0; i<myList.length ; i++){
        sensorList.add(Sensor(myList[i]['entityId'], myList[i]['entityId'], myList[i]['value'], myList[i]['capacity']));
      }
    });
  } else {
    print(response.statusCode);
  }
}
