import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/spray__model.dart';
import 'package:flutter_valorantagent/network/spray_api.dart';
import 'package:flutter_valorantagent/page/spray/spray_detail.dart';
import 'package:hexcolor/hexcolor.dart';

class SpraysPage extends StatefulWidget {
  const SpraysPage({super.key});

  @override
  State<SpraysPage> createState() => _SpraysPageState();
}

class _SpraysPageState extends State<SpraysPage> {
  List<Spray> listSpray = [];
  SprayApi sprayApi = SprayApi();

  getSpray() async {
    listSpray = await sprayApi.fetchSpray();
    setState(() {});
  }

  @override
  void initState() {
    getSpray();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('#0F1923'),
        title: const Text(
          'Spray',
          style: TextStyle(fontFamily: 'Valorant'),
        ),
      ),
      body: GridView.count(
        childAspectRatio: 1,
        crossAxisCount: 2,
        primary: true,
        mainAxisSpacing: 10,
        crossAxisSpacing: 2,
        children: listSpray.map(
          (spray) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SprayDetail(
                      title: spray.displayName,
                      image: spray.fullTransparentIcon,
                    );
                  },
                ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      spray.fullTransparentIcon != null
                          ? spray.displayIcon
                          : 'https://media.valorant-api.com/sprays/3d2bcfc5-442b-812e-3c08-9180d6b36077/fulltransparenticon.png',
                      // fit: BoxFit.fill,
                      width: 90,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      spray.displayName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Valorant', color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
