import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const FaceAgeApp());
}

class FaceAgeApp extends StatelessWidget {
  const FaceAgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Face Age Estimator',
      home: const HomeScreen(),
    );
  }
}
