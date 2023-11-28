import 'package:flutter/material.dart';
import 'package:flutter_pokedex/page/home_screen.dart';

void main() {
  runApp(const ValorantAgentApp());
}

class ValorantAgentApp extends StatelessWidget {
  const ValorantAgentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
