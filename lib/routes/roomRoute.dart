import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Data/Models/RoomModel.dart';

import '../Data/my_globals.dart' as globals;

var roomList = <Room>[];

List<Room> getAllRooms() {
  // appel Api
  getData();
  return roomList;
}


void getData() async {
  final String url = "http://" + globals.ip + ":3000/room";
  http.Response response =await http.get(Uri().resolve(url));

  if (response.statusCode == 200) {
    var rooms = json.decode(response.body);
    //print(rooms);
    Map myMap = rooms;
    roomList.clear();

    myMap.forEach((key, value) {
      List myList = value;
      List<String> listVide = [];
      for (int i=0; i<myList.length ; i++){
        if(myList[i]['sensors'] != null){
          roomList.add(Room(myList[i]['entityId'], myList[i]['name'], myList[i]['sensors']));
        }else{
          roomList.add(Room(myList[i]['entityId'], myList[i]['name'], listVide));
        }


      }
    });
  } else {
    print(response.statusCode);
  }
}

Future addRoom(String name) async {
  var globals;

  final String url = "http://" + globals.ip + ":3000/room";
  print("url");
  print(url);
  final Uri uri = Uri.parse(url);
  print(uri);
  Map data = {
    'name': name.trim(),
    'sensors': [],
  };
  print(data);
  var bodyToSend = jsonEncode(data);
  print("bodyToSend");
  print(bodyToSend);
  try {
    final client = http.Client();
    final http.Response response = await client.post(uri,
        headers: {"Content-Type": "application/json"}, body: bodyToSend);
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      return body;
    }
  } catch (err) {
    print(err);
  }
}


Future<String?> entityId(String name) async {
  final String roomApiUrl = "http://" + globals.ip + ":3000/room";

  Map<String, dynamic> data = {
    'name': name.trim(),
    'sensors': [],
  };

  try {
    final client = http.Client();
    final http.Response response = await client.post(
      Uri.parse(roomApiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final entityId = responseBody['entityId']; // Récupérez l'entityId généré
      return entityId;
    }
  } catch (err) {
    print(err);
  }

  return null; // En cas d'échec, retournez null
}



Future<void> patch(List<String> selectedSensors, String roomEntityId) async {
  final String roomApiUrl = "http://" + globals.ip + ":3000/room";

  final String roomId = roomEntityId;
  print("roomId");
  print(roomId);
  final Uri uri = Uri.parse('${roomApiUrl}/${roomId}');
  print(uri);

  // Créez un objet contenant la liste des capteurs à ajouter à la pièce
  Map<String, dynamic> patchData = {
    'sensors': selectedSensors,
  };

  try {
    final response = await http.patch(
      uri, // Utilisez l'URL de la pièce spécifique que vous souhaitez mettre à jour
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(patchData),
    );

    if (response.statusCode == 200) {

      print('Capteurs ajoutés avec succès à la pièce');
    } else {
      print('Échec de l\'ajout des capteurs à la pièce, code de statut : ${response.statusCode}');
    }
  } catch (e) {
    // Gérer les erreurs de requête ici
    print('Erreur lors de la requête PATCH : $e');
  }
}


void getSensorsRoom() async {

  final String url = "http://" + globals.ip + ":3000/room";

  http.Response response = await http.get(Uri().resolve(url));



  if (response.statusCode == 200) {
    var rooms = json.decode(response.body);
    //print(rooms);
    Map myMap = rooms;
    roomList.clear();

    myMap.forEach((key, value) {
      List myList = value;
      List<String> listVide = [];
      for (int i=0; i<myList.length ; i++){
        if(myList[i]['sensors'] != null){
          roomList.add(Room(myList[i]['entityId'], myList[i]['name'], myList[i]['sensors']));
        }else{
          roomList.add(Room(myList[i]['entityId'], myList[i]['name'], listVide));
        }


      }
    });
  } else {
    print(response.statusCode);
  }
}
