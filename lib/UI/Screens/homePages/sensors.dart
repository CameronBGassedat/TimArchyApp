import 'package:flutter/material.dart';
import '../../../BusinessLogic/AirluxBloc.dart';
import '../../../Data/Models/SensorModel.dart';

Widget sensorsContainer(AirluxBloc airluxBloc) {
    return StreamBuilder<List<Sensor>>(
      stream: airluxBloc.sensorsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final sensors = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: sensors.length,
            itemBuilder: (context, index) {
              final sensor = sensors[index];
              return
                Card(
                  elevation: 5,
                  child: Column(
                      children : [
                        Text("ID : ${sensor.id}"),
                        Text("Sensor Type : ${sensor.name}"),
                        Text("Value : ${sensor.data}"),
                        Text("RoomID : ${sensor.roomID}"),
                      ]
                  ),
                );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }