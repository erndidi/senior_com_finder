import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SeniorComFinderApp());
}

class SeniorComFinderApp extends StatelessWidget {
  const SeniorComFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Senior Community Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}