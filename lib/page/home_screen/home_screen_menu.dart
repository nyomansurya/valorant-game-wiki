import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreenMenu extends StatelessWidget {
  const HomeScreenMenu(
      {super.key, required this.title, required this.imagePath, required this.destinationPage});

  final String title;
  final String imagePath;
  final Widget destinationPage;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return destinationPage;
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 20,
        ),
        width: 335,
        height: 138,
        decoration: BoxDecoration(
          color: HexColor('#141E29'),
          border: Border.all(
            color: Colors.red,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Valorant',
                      fontSize: 28,
                      color: Colors.white),
                ),
              ),
            ),
            Image.asset(imagePath)
            // Expanded(child: )
          ],
        ),
      ),
    );
  }
}
