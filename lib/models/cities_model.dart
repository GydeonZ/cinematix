import 'dart:convert';

Cities citiesFromJson(Map<String, dynamic> map) => Cities.fromJson(map);

String citiesToJson(Cities data) => json.encode(data.toJson());

class Cities {
  final bool success;
  final Error error;
  final List<Result> results;

  Cities({
    required this.success,
    required this.error,
    required this.results,
  });

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        success: json["success"],
        error: Error.fromJson(json["error"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Error {
  final int errorId;
  final Message message;

  Error({
    required this.errorId,
    required this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errorId: json["error_id"],
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "error_id": errorId,
        "message": message.toJson(),
      };
}

class Message {
  final String id;
  final String en;

  Message({
    required this.id,
    required this.en,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "en": en,
      };
}

class Result {
  final String id;
  final String name;

  Result({
    required this.id,
    required this.name,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
