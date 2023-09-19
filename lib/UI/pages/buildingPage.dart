import 'package:flutter/material.dart';
import 'package:tim_archy_app/routes/roomRoute.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../Data/Models/RoomModel.dart';
import 'roomPage.dart';

class BuildingPage extends StatefulWidget {
  @override
  _BuildingPageState createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> {
  List<Room> rooms = [];
  TextEditingController roomNameController = TextEditingController();
  bool showError = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context)
    {
      return Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                _showRoomDialog(context);
              },
              child: Text(
                  'Ajouter +', style: TextStyle(color: Color(0xFF40A8C4))),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getAllRooms().length,
                itemBuilder: (context, index) {
                  print("room");

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => RoomPage(Room(
                                getAllRooms()[index].id,
                                getAllRooms()[index].name,
                                getAllRooms()[index].sensorID))),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.meeting_room_outlined, color: Color(
                            0xFFE1F5FE)),
                        title: Text(getAllRooms()[index].name),
                        trailing: Icon(
                            Icons.arrow_forward_ios, color: Colors.grey),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
  });
  }

  void _showRoomDialog(BuildContext context) {
    setState(() {
      showError = false;
      errorMessage = '';
    });

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: roomNameController,
                decoration: InputDecoration(
                  labelText: 'Nom de la pièce',
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                /*
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: Colors.transparent,
                ), */
                onPressed: () {
                  String roomName = roomNameController.text.trim();


                  if (roomName.isNotEmpty) {
                    setState(() {
                      // TODO: POST request
                      addRoom(roomName);
                      Navigator.pop(context);
                      roomNameController.clear();
                    });
                  } else {
                    // Champ vide, active l'affichage du message d'erreur
                    setState(() {
                      showError = true;
                      errorMessage = 'Le nom de la pièce ne peut pas être vide';
                    });
                  }
                },
                child: Text('Ajouter +', style: TextStyle(color: Color(0xFF40A8C4))),
              ),
              if (showError)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        );
      },
    );
  }
}
