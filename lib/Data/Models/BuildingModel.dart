class Building {
  int? id;
  String? name;
  List<int>? clientsID;
  List<int>?  roomsID;

  Building(this.id, this.name, this.clientsID, this.roomsID);

  Building.fromJson(Map<String, dynamic> json):
        id = int.parse(json['id']),
        name = json['name'] ,
        clientsID = [int.parse(json['clientsID'])],
        roomsID = [int.parse(json['roomsID'])];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'clientsID' : clientsID,
    'roomsID' : roomsID,
  };
}