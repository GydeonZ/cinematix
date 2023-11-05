import 'package:flutter/material.dart';

class MovieSectionProvider extends ChangeNotifier {
  String formatDuration(int duration) {
    final hours = (duration ~/ 60).toString().padLeft(2, '0');
    final minutes = (duration % 60).toString().padLeft(2, '0');
    return '$hours Jam $minutes Menit';
  }

}
