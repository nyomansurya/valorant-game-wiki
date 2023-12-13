import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/maps_model.dart';
import 'package:flutter_valorantagent/network/maps_api.dart';
import 'package:flutter_valorantagent/page/maps/maps_detail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stroke_text/stroke_text.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  List<Maps> listMaps = [];
  MapsApi mapsApi = MapsApi();

  getMaps() async {
    listMaps = await mapsApi.fetchMapsApi();
    setState(() {});
  }

  @override
  void initState() {
    getMaps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        backgroundColor: HexColor('#0F1923'),
        centerTitle: true,
        title: Text(
          'Maps',
          style: TextStyle(
            fontFamily: 'Valorant',
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: listMaps.length,
        itemBuilder: (context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return MapsDetail(
                    displayName: listMaps[index].displayName,
                    narrativeDescription: listMaps[index].narrativeDescription,
                    coordinates: listMaps[index].coordinates,
                    mapDisplay: listMaps[index].mapDisplay,
                    mapListIcon: listMaps[index].mapListIcon,
                    mapsBackground: listMaps[index].mapsBackground,
                  );
                },
              ));
            },
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Image.network(
                      listMaps[index].mapListIcon,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                        right: 20,
                        child: StrokeText(
                          text: listMaps[index].displayName,
                          textStyle: TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                        // Text(
                        //   listMaps[index].displayName,
                        //   style: TextStyle(
                        //     fontFamily: 'Valorant',
                        //     fontSize: 20,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        )
                  ],
                )),
          );
        },
      ),
    );
  }
}
