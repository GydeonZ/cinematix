import 'package:dio/dio.dart';
import 'package:praktikum/models/cities_model.dart';
import 'package:praktikum/models/fnb_model.dart';
import 'package:praktikum/models/now_playing_model.dart';
import 'package:praktikum/models/promo_model.dart';
import 'package:praktikum/models/upcoming_movie_model.dart';
import 'package:praktikum/utils/constants/urls.dart';


class ApiServices {
  final Dio _dio = Dio();

  // Method untuk menambahkan token Bearer ke header permintaan
  void addBearerToken() {
    String bearerToken =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtc2lzZG4iOiIiLCJ1c2VyX2lkIjoiIiwiYXV0aF9zaWduIjoiMTBmNzExZjEtMDlmMy00OTlmLTg0NTAtZDBlMjU2MjEwZDMyIiwicHVycG9zZSI6Im5vdGxvZ2luIiwiYXVkIjoiVGl4SUQgTWlkZGxld2FyZSIsImV4cCI6MTcwNjg1MTQwMywiaWF0IjoxNjk4MjExNDAzLCJpc3MiOiJUaXhJRCBTZWN1cml0eSBBdXRob3JpdHkiLCJzdWIiOiJNb2JpbGUgYXV0aG9yaXphdGlvbiB0b2tlbiJ9.wrNCvRByB2ILP7rBno14S2HqwN8bFwoWpEmZ_SKbg6I'; // Ganti dengan token Anda
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