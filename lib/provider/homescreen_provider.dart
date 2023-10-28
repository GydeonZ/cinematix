import 'package:flutter/material.dart';
import 'package:praktikum/models/cities_model.dart';
import 'package:praktikum/models/now_playing_model.dart';
import 'package:praktikum/services/services.dart';

class NowPlayingProvider extends ChangeNotifier {
  NowPlayingMovie? nowPlayingMovie;
  bool isLoading = true;
  
  void getNowPlaying() async {
    nowPlayingMovie = await ApiServices().fetchNowPlayingMovie();
    isLoading = false;
    notifyListeners();
  }
}

class CitiesProvider extends ChangeNotifier {
  Cities? cities;
  bool isLoading = true;
  void getCities() async {
    cities = await ApiServices().fetchCities();
    isLoading = false;
    notifyListeners();
  }
}
