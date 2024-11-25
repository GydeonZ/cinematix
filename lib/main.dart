import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts/view/screen/splash.dart';
import 'package:uts/viewmodel/fnb_provider.dart';
import 'package:uts/viewmodel/homescreen_provider.dart';
import 'package:uts/viewmodel/movie_section_provider.dart';

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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: Splash(),
    );
  }
}
