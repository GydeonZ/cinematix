import 'package:flutter/material.dart';
import 'package:praktikum/view/screen/splash.dart';
import 'package:praktikum/viewmodel/fnb_provider.dart';
import 'package:praktikum/viewmodel/homescreen_provider.dart';
import 'package:praktikum/viewmodel/movie_section_provider.dart';
import 'package:provider/provider.dart';

import 'viewmodel/checkout_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Add your providers here
        ChangeNotifierProvider<HomeScreenProvider>(
          create: (context) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider<GetPromoProvider>(
          create: (context) => GetPromoProvider(),
        ),
        ChangeNotifierProvider<MovieSectionProvider>(
          create: (context) => MovieSectionProvider(),
        ),
        ChangeNotifierProvider<FoodAndDrinks>(
          create: (context) => FoodAndDrinks(),
        ),
        ChangeNotifierProvider<GetCartProvider>(
          create: (context) => GetCartProvider(),
        ),
        ChangeNotifierProvider<CalculatePrice>(
          create: (context) => CalculatePrice(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: Splash(),
    );
  }
}
