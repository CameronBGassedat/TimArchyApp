
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../Data/Models/SensorModel.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../routes/sensorRoute.dart';
import '../Helpers/helper.dart';
import '../Screens/pairPages/device_screen.dart';

var sensorList = <Sensor>[];

const TEMPERATURE = "temperature";
const HUMIDITY= "humidity";



class SensorListPage extends StatefulWidget{
  const SensorListPage({super.key});

  @override
  State<SensorListPage> createState() => _SensorListPageState();
}


class _SensorListPageState extends State<SensorListPage> {
  String selectedCategory = "Tout";

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ["Tout", "temperature", "humidity"];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF70bed3),
        child: Icon(Icons.add_circle),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DevicesScreen())),
      ),
      body: Column( // Utilisez Column comme parent
        children: <Widget>[

          Container(
            height: 30.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0), // Espacement horizontal entre les boutons
                  child: ElevatedButton(
                    onPressed: () {
                      updateCategory(category);
                    },
                    child: Text(category),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      ),
                      primary: selectedCategory == category ? Color(0xFF40A8C4) : Color(0xFF80DEEA),
                    ),
                  ),
                );
              },
            ),
          ),

          TimerBuilder.periodic(Duration(seconds: 1), builder: (context){
            //getData();
            return Flexible(
                child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: getAllSensors().length,
                itemBuilder: (BuildContext context, int index) {
                //final sensor = sensorList[index];
                  Sensor sensor = getAllSensors()[index];
                if (selectedCategory != "Tout" && sensor.capacity != selectedCategory) {
                return Container();
                }
                print('SENSORVALUE: $sensor.value');
                return Card(
                elevation: 5.0,
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                leading: Icon(selectIcon(sensor.capacity),
                color: Color(0xFF40A8C4),
                size: 40,
                ),
                title: Text('${sensor.id} ',
                style: const TextStyle(fontSize: 20)),
                subtitle: Text(translate(sensor.capacity)),
                trailing: Text(addUnity(sensor.capacity, sensor.value),
                style: const TextStyle(fontSize: 25)),
                ),
                );
                },
                ),
                );
                }),


                  ],
                ),

    );
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