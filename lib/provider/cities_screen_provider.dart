// import 'package:flutter/material.dart';
// import 'package:praktikum/models/cities_model.dart';

// class FilterCitiesProvider extends ChangeNotifier {
//   Cities? cities;
//   final List<Result> filteredCities = [];
//   TextEditingController searchController = new TextEditingController();

//   void filterCities() {
//     List<Result> _filteredCities = [];
//     _filteredCities.addAll(cities!.results);
//     if (SearchController.text.isNotEmpty) {
//       _filteredCities.retainWhere((city) {
//         String searchTerm = SearchController.text.toLowerCase();
//         String cityName = city.cityName.toLowerCase();
//         return cityName.contains(searchTerm);
//       });
//       filteredCities = _filteredCities;
//       notifyListeners();
      
//     }
//   }
// }
