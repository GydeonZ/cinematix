class Promo {
  final bool success;
  final Error error;
  final List<Result> results;

  Promo({
    required this.success,
    required this.error,
    required this.results,
  });

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
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
  final int promoStart;
  final int promoEnd;
  final String uri;
  final String imageFile;
  final String promoTag;
  final int createdAt;
  final int updatedAt;

  Result({
    required this.id,
    required this.name,
    required this.promoStart,
    required this.promoEnd,
    required this.uri,
    required this.imageFile,
    required this.promoTag,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        promoStart: json["promo_start"],
        promoEnd: json["promo_end"],
        uri: json["uri"],
        imageFile: json["image_file"],
        promoTag: json["promo_tag"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "promo_start": promoStart,
        "promo_end": promoEnd,
        "uri": uri,
        "image_file": imageFile,
        "promo_tag": promoTag,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
