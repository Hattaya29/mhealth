// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    List<User>? users;

  String? email;

  String? password;

  var firstname;

    Users({
        this.users,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
    );

  Object? get length => null;

  Null get isEmpty => null;

  get id => null;

    Map<String, dynamic> toJson() => {
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
    };
}

class User {
    int? id;
    String? firstname;
    String? lastname;
    int? age;
    List<String>? attention;
    String? email;
    String? password;

    User({
        this.id,
        this.firstname,
        this.lastname,
        this.age,
        this.attention,
        this.email,
        this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        attention: json["attention"] == null ? [] : List<String>.from(json["attention"]!.map((x) => x)),
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "attention": attention == null ? [] : List<dynamic>.from(attention!.map((x) => x)),
        "email": email,
        "password": password,
    };
}
