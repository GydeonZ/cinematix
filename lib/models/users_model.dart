import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  final String name;
  final String avatar;
  int balance;
  final String id;

  Users({
    required this.name,
    required this.avatar,
    required this.balance,
    required this.id,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        avatar: json["avatar"],
        balance: json["balance"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "balance": balance,
        "id": id,
      };
}
