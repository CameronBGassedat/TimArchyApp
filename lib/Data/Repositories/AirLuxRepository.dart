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
    var responseBody = await api.getCall(api.routeQueries["Building"]!);
    List jsonResponse = jsonDecode(responseBody);

    var buildings = jsonResponse.map(
            (item) => Building.fromJson(item)
    ).toList();
    return buildings;
  }

  Future<List<Sensor>> getAllSensors()
  async {
    var responseBody = await api.getCall(api.routeQueries["Sensor"]!);
    List jsonResponse = jsonDecode(responseBody);

    var sensors = jsonResponse.map(
            (item) => Sensor.fromJson(item)
    ).toList();
    return sensors;
  }

  Future<List<Room>> getAllRooms()
  async {
    var responseBody = await api.getCall(api.routeQueries["Room"]!);
    List jsonResponse = jsonDecode(responseBody);

    var rooms = jsonResponse.map(
            (item) => Room.fromJson(item)
    ).toList();
    return rooms;
  }

  Future<List<User>> getAllUsers()
  async {
    var responseBody = await api.getCall(api.routeQueries["User"]!);
    List jsonResponse = jsonDecode(responseBody);

    var users = jsonResponse.map(
            (item) => User.fromJson(item)
    ).toList();
    return users;
  }
}

