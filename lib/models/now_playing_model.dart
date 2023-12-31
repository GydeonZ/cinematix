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
  final String movieId;
  final String synopsis;
  final String productionCompany;
  final String actor;
  final List<GenreId> genreIds;
  final int duration;
  final String posterPath;
  final String ageCategory;
  final String trailerPath;
  final String trailerThumbnailPath;
  final String producer;
  final String director;
  final int presaleFlag;
  final bool isCustomEvent;
  final double ratingScore;
  final bool scoreHomeDisplay;
  final List<Merchant> merchant;

  Result({
    required this.id,
    required this.title,
    required this.movieId,
    required this.synopsis,
    required this.productionCompany,
    required this.actor,
    required this.genreIds,
    required this.duration,
    required this.posterPath,
    required this.ageCategory,
    required this.trailerPath,
    required this.trailerThumbnailPath,
    required this.producer,
    required this.director,
    required this.presaleFlag,
    required this.isCustomEvent,
    required this.ratingScore,
    required this.scoreHomeDisplay,
    required this.merchant,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        movieId: json["movie_id"],
        synopsis: json["synopsis"],
        productionCompany: json["production_company"],
        actor: json["actor"],
        genreIds: List<GenreId>.from(
            json["genre_ids"].map((x) => GenreId.fromJson(x))),
        duration: json["duration"],
        posterPath: json["poster_path"],
        ageCategory: json["age_category"],
        trailerPath: json["trailer_path"],
        trailerThumbnailPath: json["trailer_thumbnail_path"],
        producer: json["producer"],
        director: json["director"],
        presaleFlag: json["presale_flag"],
        isCustomEvent: json["is_custom_event"],
        ratingScore: json["rating_score"]?.toDouble(),
        scoreHomeDisplay: json["score_home_display"],
        merchant: List<Merchant>.from(
            json["merchant"].map((x) => Merchant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "movie_id": movieId,
        "synopsis": synopsis,
        "production_company": productionCompany,
        "actor": actor,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x.toJson())),
        "duration": duration,
        "poster_path": posterPath,
        "age_category": ageCategory,
        "trailer_path": trailerPath,
        "trailer_thumbnail_path": trailerThumbnailPath,
        "producer": producer,
        "director": director,
        "presale_flag": presaleFlag,
        "is_custom_event": isCustomEvent,
        "rating_score": ratingScore,
        "score_home_display": scoreHomeDisplay,
        "merchant": List<dynamic>.from(merchant.map((x) => x.toJson())),
      };
}

class GenreId {
  final String id;
  final String name;
  final DateTime updatedAt;

  GenreId({
    required this.id,
    required this.name,
    required this.updatedAt,
  });

  factory GenreId.fromJson(Map<String, dynamic> json) => GenreId(
        id: json["id"],
        name: json["name"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Merchant {
  final String merchantId;
  final String merchantName;

  Merchant({
    required this.merchantId,
    required this.merchantName,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        merchantId: json["merchant_id"],
        merchantName: json["merchant_name"],
      );

  Map<String, dynamic> toJson() => {
        "merchant_id": merchantId,
        "merchant_name": merchantName,
      };
}
