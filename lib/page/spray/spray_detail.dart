import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SprayDetail extends StatelessWidget {
  const SprayDetail({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        backgroundColor: HexColor('#0F1923'),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Valorant',
            fontSize: 15
          ),
        ),
      ),
      body: Center(
        child: Image.network(image, width: double.infinity,),
      ),
    );
  }
}
