import 'package:flutter/material.dart';
import 'package:tim_archy_app/Data/Models/RoomModel.dart';
import 'package:tim_archy_app/routes/sensorRoute.dart';

import '../../routes/roomRoute.dart';

class RoomPage extends StatefulWidget {
  //Room room = Room(id, name, sensorID);

  final Room room;
  RoomPage(this.room);

  @override
  _RoomPageState createState() => _RoomPageState();
}


class _RoomPageState extends State<RoomPage> {


  late Room room; // Déclaration de la variable room

  List<String> alldSensors = getAllSensorById();
  List<String> selectedSensors = [];

  @override
  void initState() {
    super.initState();
    room = widget.room; // Initialisation de la variable room à partir de widget.room
  }


  // Sélection des capteurs
  void toggleItem(String item) {
    setState(() {
      if (selectedSensors.contains(item)) {
        selectedSensors.remove(item);
      } else {
        selectedSensors.add(item);
      }
    });
  }

  void showPopup() {
    bool isChecked = false;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.blue[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Text(
            "Sélectionnez des capteurs",
            style: TextStyle(color: Color(0xFF40A8C4)),
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 300.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (final item in alldSensors)
                    InkWell(
                      onTap: () {
                        toggleItem(item);
                      },
                      child: CheckboxListTile(
                        title: Text(item),
                        value: selectedSensors.contains(item),
                        onChanged: (value) {
                          //toggleItem(item);
                          setState(() {
                            if (selectedSensors.contains(item)) {
                              isChecked = value!;
                              selectedSensors.remove(item);
                            } else {
                              isChecked = value!;
                              selectedSensors.add(item);
                            }
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Ajouter +", style: TextStyle(color: Color(0xFF40A8C4)),
              ),
              onPressed: () async {
                print("111111111111111111111111111111111");
                print(room.id);
                await patch(selectedSensors,room.id as String);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    room.sensorID = selectedSensors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF40A8C4)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pièce', style: TextStyle(color: Color(0xFF40A8C4))),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF40A8C4),
        onPressed: () {
          showPopup();
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: room.sensorID.length,
        itemBuilder: (context, index) {
          final selectedItem = room.sensorID[index];
          return Card(
            child: ListTile(
              title: Text(selectedItem),
            ),
          );
        },
      ),
    );
  }
}