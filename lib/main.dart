import 'package:flutter/material.dart';
import 'package:praktikum/provider/homescreen_provider.dart';
import 'package:praktikum/screen/splash.dart';
import 'package:provider/provider.dart';

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
        // ChangeNotifierProvider<MovieSectionProvider>(
          // create: (context) => MovieSectionProvider(),
        // ),
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
