import 'package:flutter/material.dart';
import 'package:praktikum/models/cities_model.dart';
import 'package:praktikum/models/now_playing_model.dart';
import 'package:praktikum/models/promo_model.dart';
import 'package:praktikum/services/services.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool isLoading = true;
  NowPlayingMovie? nowPlayingMovie;
  Cities? cities;

  Future<void> getCities() async {
    isLoading = true;
    cities = await ApiServices().fetchCities();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getNowPlaying(String id) async {
    isLoading = true;
    nowPlayingMovie = await ApiServices().fetchNowPlayingMovie(id);
    isLoading = false;
    notifyListeners();
  }
}


class GetPromoProvider extends ChangeNotifier {
  Promo? promo;
  bool isLoading = true;
  void getPromo() async {
    isLoading = true;
    promo = await ApiServices().fetchPromo();
    isLoading = false;
    notifyListeners();
  }
}