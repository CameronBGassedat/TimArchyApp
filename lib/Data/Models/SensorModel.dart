/*class Sensor{
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
}*/


class Sensor {
    String id;
    String name;
    String value;
    String capacity;

    Sensor(this.id, this.name, this.value, this.capacity);

    Sensor.fromJson(Map<String, dynamic> json):
            id = json['id'],
            name = json['name'] ,
            value = json['data'],
            capacity = json['capacity'];

    Map<String, dynamic> toJson() => {
        'id' : id,
        'name' : name,
        'value' : value,
        'capacity' : capacity,
    };
}