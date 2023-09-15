import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  final int userId;
  final int id;
  final String title;
  final String body;

  Users({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        userId:
            json["userId"] ?? 0, // Provide a default value if "userId" is null
        id: json["id"] ?? 0, // Provide a default value if "id" is null
        title:
            json["title"] ?? "", // Provide a default value if "title" is null
        body: json["body"] ?? "", // Provide a default value if "body" is null
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  removeAt(int id) {}
}
