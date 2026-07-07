import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TechTinderApp());
}

class TechTinderApp extends StatelessWidget {
  const TechTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Tinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
