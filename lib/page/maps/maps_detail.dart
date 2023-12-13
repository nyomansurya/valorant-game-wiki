import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MapsDetail extends StatelessWidget {
  const MapsDetail({
    super.key,
    required this.displayName,
    required this.narrativeDescription,
    required this.coordinates,
    required this.mapDisplay,
    required this.mapListIcon,
    required this.mapsBackground,
  });

  final String displayName;
  final String narrativeDescription;
  final String coordinates;
  final String mapDisplay;
  final String mapListIcon;
  final String mapsBackground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('#0F1923'),
        title: Text(
          'Map Detail',
          style: TextStyle(fontFamily: 'Valorant'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Image.network(mapsBackground),
                  Positioned(
                    top: 15,
                    left: 15,
                    child: Text(
                      coordinates,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: Text(
                      displayName,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'Valorant',
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                narrativeDescription,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Map Layout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Image.network(mapDisplay, width: double.infinity, height: 300,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
