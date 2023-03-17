class Sensor{
    int? id;
    String? name;
    String? data;
    List<int>? roomID;

    Sensor({this.id, this.name, this.data, this.roomID});

    Sensor.fromJson(Map<String, dynamic> json):
        id = int.parse(json['id']),
        name = json['name'] ,
        data = json['data'],
        roomID = [int.parse(json['roomID'])];

    Map<String, dynamic> toJson() => {
        'id' : id,
        'name' : name,
        'data' : data,
        'roomID' : roomID,
    };
}