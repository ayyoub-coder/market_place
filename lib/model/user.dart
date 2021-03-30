import 'dart:convert';

class User {

  int user_id;
  String first_name;
  String last_name;
  String email;
  String api_token;

  User(this.first_name, this.last_name, this.email, this.api_token);

  User.fromJson(Map<String,dynamic> jsonObject){
    this.first_name = jsonObject['first_name'];
    this.last_name = jsonObject['last_name'];
    this.email = jsonObject['email'];
    this.api_token= jsonObject['api_token'];
    this.user_id = jsonObject['user_id'];
  }

}








// To parse this JSON data, do
//
//     final saleslist = saleslistFromJson(jsonString);



Saleslist saleslistFromJson(String str) => Saleslist.fromJson(json.decode(str));

String saleslistToJson(Saleslist data) => json.encode(data.toJson());

class Saleslist {
  Saleslist({
    this.params,
  });

  Params params;

  factory Saleslist.fromJson(Map<String, dynamic> json) => Saleslist(
    params: Params.fromJson(json["params"]),
  );

  Map<String, dynamic> toJson() => {
    "params": params.toJson(),
  };
}

class Params {
  Params({
    this.db,
    this.login,
    this.password,
  });

  String db;
  String login;
  String password;

  factory Params.fromJson(Map<String, dynamic> json) => Params(
    db: json["db"],
    login: json["login"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "db": db,
    "login": login,
    "password": password,
  };
}
