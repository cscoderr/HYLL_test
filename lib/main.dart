import 'package:flutter/material.dart';
import 'package:hyll_test/app/view/app.dart';
import 'package:hyll_test/data/data.dart';

void main() {
  final homeRepository = HomeRepositoryImpl();
  runApp(HyllApp(
    homeRepository: homeRepository,
  ));
}
