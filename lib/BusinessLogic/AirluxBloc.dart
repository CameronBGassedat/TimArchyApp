import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tim_archy_app/Data/Repositories/AirLuxRepository.dart';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
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
  late User _currentUser;

  final _buildingsSubject = BehaviorSubject<List<Building>>();
  final _roomsSubject = BehaviorSubject<List<Room>>();
  final _usersSubject = BehaviorSubject<List<User>>();
  final _sensorsSubject = BehaviorSubject<List<Sensor>>();
  final _currentUserSubject = BehaviorSubject<User>();

  Stream<List<Building>> get buildingsStream => _buildingsSubject.stream;
  Stream<List<Room>> get roomsStream => _roomsSubject.stream;
  Stream<List<User>> get usersStream => _usersSubject.stream;
  Stream<List<Sensor>> get sensorsStream => _sensorsSubject.stream;
  Stream<User> get currentUserStream => _currentUserSubject.stream;

  AirluxBloc()
  {
    _repository = AirluxRepository();
    loadSensors();
  }

  //#region GET REGION
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
  //#endregion

  //#region POST USER REGION
  Future<void> addUser(String name, String email, String password)
  async {
    const uuid = Uuid();
    Map<String, dynamic> bodymap = {
      'id':  uuid.v4(),
      'name': name,
      'email' : email,
      'password' : hashPassword(password)
    };
    await _repository.postUser(bodymap);
  }

  Future<void> loadSingleUser(String email)
  async {
    await _repository.getSingleUser(email);
  }

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', hashPassword(email));
  }

  Future<String> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
  }
  //#endregion

  void dispose() {
    _buildingsSubject.close();
    _roomsSubject.close();
    _usersSubject.close();
    _sensorsSubject.close();
  }
}
