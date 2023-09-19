class Room {
  int? id;
  String? name;
  List<int>? sensorID;

  Room(this.id, this.name, this.sensorID);

  Room.fromJson(Map<String, dynamic> json):
    id = int.parse(json['id']),
    name = json['name'] ,
    sensorID = [int.parse(json['sensorID'])];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'sensorID' : sensorID,
  };
}