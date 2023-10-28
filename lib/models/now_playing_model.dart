import 'dart:convert';

NowPlayingMovie nowPlayingMovieFromJson(Map<String, dynamic> map) =>
    NowPlayingMovie.fromJson(map);

String nowPlayingMovieToJson(NowPlayingMovie data) =>
    json.encode(data.toJson());

class NowPlayingMovie {
  final bool success;
  final Error error;
  final List<Result> results;

  NowPlayingMovie({
    required this.success,
    required this.error,
    required this.results,
  });

  factory NowPlayingMovie.fromJson(Map<String, dynamic> json) =>
      NowPlayingMovie(
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
  final String title;
  final String posterPath;
  final String trailerPath;

  Result({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.trailerPath,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        posterPath: json["poster_path"],
        trailerPath: json["trailer_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "poster_path": posterPath,
        "trailer_path": trailerPath,
      };
}
