class User {
    int? id;
    String? name;
    String? email;
    String? password;

    User(this.id, this.name, this.email, this.password);

    User.fromJson(Map<String, dynamic> json):
            id = int.parse(json['id']),
            name = json['name'] ,
            email = json['email'],
            password = json['password'];

    Map<String, dynamic> toJson() => {
        'id' : id,
        'name' : name,
        'email' : email,
        'password' : password,
    };
}