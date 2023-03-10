import 'package:tim_archy_app/Data/Repositories/AirLuxRepository.dart';
import '../Data/Models/BuildingModel.dart';
import '../Data/Models/RoomModel.dart';
import '../Data/Models/UserModel.dart';
import '../Data/Models/SensorModel.dart';

class AirluxBloc {
  late AirluxRepository repository;
  late List<Building> buildings;
  late List<Room> rooms;
  late List<User> users;
  late List<Sensor> sensors;

  AirluxBloc()
  {
    repository = AirluxRepository();
  }

  Future<void> LoadSensors()
  async {
    sensors = await repository.getAllSensors();
  }

  Future<void> LoadBuildings()
  async {
    buildings = await repository.getAllBuildings();
  }

  Future<void> LoadUsers()
  async {
    users = await repository.getAllUsers();
  }

  Future<void> LoadRooms()
  async {
    rooms = await repository.getAllRooms();
  }
}
