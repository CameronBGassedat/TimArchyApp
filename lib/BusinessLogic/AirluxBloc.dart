import 'package:flutter/material.dart';
import 'package:tim_archy_app/Data/Repositories/AirLuxRepository.dart';
import 'package:rxdart/rxdart.dart';
import '../Data/Models/BuildingModel.dart';
import '../Data/Models/RoomModel.dart';
import '../Data/Models/UserModel.dart';
import '../Data/Models/SensorModel.dart';

class AirluxBloc {
  late AirluxRepository _repository;
  late List<Building> _buildings;
  late List<Room> _rooms;
  late List<User> _users;
  late List<Sensor> _sensors;

  final _buildingsSubject = BehaviorSubject<List<Building>>();
  final _roomsSubject = BehaviorSubject<List<Room>>();
  final _usersSubject = BehaviorSubject<List<User>>();
  final _sensorsSubject = BehaviorSubject<List<Sensor>>();

  Stream<List<Building>> get buildingsStream => _buildingsSubject.stream;
  Stream<List<Room>> get roomsStream => _roomsSubject.stream;
  Stream<List<User>> get usersStream => _usersSubject.stream;
  Stream<List<Sensor>> get sensorsStream => _sensorsSubject.stream;

  AirluxBloc()
  {
    _repository = AirluxRepository();
    loadSensors();
  }

  Future<void> loadSensors()
  async {
    _sensors = await _repository.getAllSensors();
    _sensorsSubject.add(_sensors);
  }

  Future<void> loadBuildings()
  async {
    _buildings = await _repository.getAllBuildings();
    _buildingsSubject.add(_buildings);
  }

  Future<void> loadUsers()
  async {
    _users = await _repository.getAllUsers();
    _usersSubject.add(_users);
  }

  Future<void> loadRooms()
  async {
    _rooms = await _repository.getAllRooms();
    _roomsSubject.add(_rooms);
  }

  Widget buildSensorsListView() {
    return StreamBuilder<List<Sensor>>(
      stream: sensorsStream,
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

  void dispose() {
    _buildingsSubject.close();
    _roomsSubject.close();
    _usersSubject.close();
    _sensorsSubject.close();
  }
}
