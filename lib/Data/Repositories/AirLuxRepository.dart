import 'dart:convert';

import '../DataProviders/AirluxApi.dart';
import '../Models/BuildingModel.dart';
import '../Models/RoomModel.dart';
import '../Models/SensorModel.dart';
import '../Models/UserModel.dart';

class AirluxRepository {
  late AirluxApi api;

  AirluxRepository()
  {
    api = AirluxApi();
  }

  Future<List<Building>> getAllBuildings()
  async {
    var response = await api.getCall(api.routeQueries["Building"]!);
    //var buildings = Building(response.data.id, name, clientsID, roomsID)
    var buildings = null;
    return buildings;
  }

  Future<List<Sensor>> getAllSensors()
  async {
    var responseBody = await api.getCall(api.routeQueries["Sensor"]!);
    print("Response$responseBody");
    List jsonResponse = jsonDecode(responseBody);

    var sensorList = jsonResponse.map(
            (item) => Sensor.fromJson(item)
    ).toList();
    return sensorList;
  }

  Future<List<Room>> getAllRooms()
  async {
    var response = await api.getCall(api.routeQueries["Room"]!);
    //var rooms = Building(response.data.id, name, clientsID, roomsID)
    var rooms = null;
    return rooms;
  }

  Future<List<User>> getAllUsers()
  async {
    var response = await api.getCall(api.routeQueries["User"]!);
    //var users = Building(response.data.id, name, clientsID, roomsID)
    var users = null;
    return users;
  }
}