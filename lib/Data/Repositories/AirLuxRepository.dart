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

  Future<User> getSingleUser(String email)
  async {
    var responseBody = await api.getCall(api.routeQueries["User"]! + email);
    List jsonResponse = jsonDecode(responseBody);

    var user = User.fromJson(jsonResponse as Map<String, dynamic>);
    return user;
  }

  Future<void> postUser(Map<String, dynamic> bodymap)
  async {
    var responseBody = await api.postCall(api.routeQueries["User"]!, bodymap);
    print(responseBody);
  }

  Future<void> postSensor(Map<String, dynamic> bodymap)
  async {
    //Map<String, dynamic> bodymap = {'id': 1, 'name': 'bob', 'data' : '12 degrees', 'roomID' : 11};
    var responseBody = await api.postCall(api.routeQueries["Sensor"]!, bodymap);
    print(responseBody);
  }

  Future<void> postBuilding(Map<String, dynamic> bodymap)
  async {
    var responseBody = await api.postCall(api.routeQueries["Building"]!, bodymap);
    print(responseBody);
  }

  Future<void> postRoom(Map<String, dynamic> bodymap)
  async {
    var responseBody = await api.postCall(api.routeQueries["Room"]!, bodymap);
    print(responseBody);
  }
}