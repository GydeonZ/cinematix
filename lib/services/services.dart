import 'package:dio/dio.dart';
import 'package:uts/models/cities_model.dart';
import 'package:uts/models/fnb_model.dart';
import 'package:uts/models/now_playing_model.dart';
import 'package:uts/models/promo_model.dart';
import 'package:uts/models/upcoming_movie_model.dart';
import 'package:uts/utils/constants/urls.dart';


class ApiServices {
  final Dio _dio = Dio();

  // Method untuk menambahkan token Bearer ke header permintaan
  void addBearerToken() {
    String bearerToken =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtc2lzZG4iOiIiLCJ1c2VyX2lkIjoiIiwiYXV0aF9zaWduIjoiZTNlODA3YTAtMjEyZC00ODBkLWE4ZGYtYjA2ZTFkYmE2MzhhIiwicHVycG9zZSI6Im5vdGxvZ2luIiwiYXVkIjoiVGl4SUQgTWlkZGxld2FyZSIsImV4cCI6MTc0MDk0MjY4NywiaWF0IjoxNzMyMzAyNjg3LCJpc3MiOiJUaXhJRCBTZWN1cml0eSBBdXRob3JpdHkiLCJzdWIiOiJNb2JpbGUgYXV0aG9yaXphdGlvbiB0b2tlbiJ9.q4GUAgV6ejLMrUPQsb86i2nr5ywhHd8c3AtqtRxGujc'; // Ganti dengan token Anda
    _dio.options.headers['Authorization'] = bearerToken;
  }

  Future<NowPlayingMovie> fetchNowPlayingMovie(String id) async {
    try {
      addBearerToken();

      final response = await _dio.get('${NowPlayingUrls.baseUrl}$id');
      return nowPlayingMovieFromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UpcomingMovie> fetchUpcomingMovie(String id) async {
    try {
      addBearerToken();

      final response = await _dio.get('${UpcomingMovieUrls.baseUrl}$id');

      return upcomingMovieFromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Cities> fetchCities() async {
    try {
      addBearerToken();

      final response = await _dio.get(CitiesUrls.baseUrl);
      return citiesFromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Promo> fetchPromo() async {
    try {
      addBearerToken();

      final response = await _dio.get(PromoUrls.baseUrl);
      return Promo.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FoodnDrinks>> fetchfnb() async {
    try {
      final response = await _dio.get(FoodnDrinkUrls.baseUrl);
      final List<dynamic> jsonData = response.data;
      final List<FoodnDrinks> foodnDrinksList =
          jsonData.map((item) => FoodnDrinks.fromJson(item)).toList();
      return foodnDrinksList;
    } catch (e) {
      rethrow;
    }
  }
}