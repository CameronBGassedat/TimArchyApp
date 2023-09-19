class User {
  int? id;
  String? name;
  String? email;

  User(this.id, this.name, this.email);

  User.fromJson(Map<String, dynamic> json):
    id = int.parse(json['id']),
    name = json['name'] ,
    email = json['email'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'email' : email,
  };
}