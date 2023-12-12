import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stroke_text/stroke_text.dart';

class PlayerCardsDetail extends StatelessWidget {
  const PlayerCardsDetail(
      {super.key, required this.imageUrl, required this.imageName});

  final String imageUrl;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: ,
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned.fill(
          child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 8,
                sigmaY: 8,
              ),
              child: Container(
                color: Colors.black.withOpacity(0),
              )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: HexColor('#0F1923'),
            centerTitle: true,
            title: Text(
              'cards detail',
              style: TextStyle(
                fontFamily: 'Valorant',
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.network(
                    imageUrl,
                    width: 250,
                  ),
                  const SizedBox(height: 20),
                  StrokeText(
                    strokeColor: HexColor('#0F1923'),
                    strokeWidth: 3,
                    text: imageName,
                    textStyle: const TextStyle(
                        fontFamily: 'Valorant',
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
