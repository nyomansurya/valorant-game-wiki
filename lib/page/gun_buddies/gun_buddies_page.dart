import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/gunbuddies_model.dart';
import 'package:flutter_valorantagent/network/gunbuddies_api.dart';
import 'package:hexcolor/hexcolor.dart';

class GunBuddiesPage extends StatefulWidget {
  const GunBuddiesPage({super.key});

  @override
  State<GunBuddiesPage> createState() => _GunBuddiesPageState();
}

class _GunBuddiesPageState extends State<GunBuddiesPage> {
  List<GunBuddies> listGunBuddies = [];
  GunBuddiesApi gunBuddiesApi = GunBuddiesApi();

  getGunBuddies() async {
    listGunBuddies = await gunBuddiesApi.fetchGunBuddiesApi();
    setState(() {});
  }

  @override
  void initState() {
    getGunBuddies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        backgroundColor: HexColor('#0F1923'),
        title: const Text(
          'Gun Buddies',
          style: TextStyle(
            fontFamily: 'Valorant',
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin:  EdgeInsets.symmetric(horizontal: 20),
        child: GridView.count(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 15,
          children: listGunBuddies.map(
            (buddie) {
              return Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Image.network(buddie.displayIcon)),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 30,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        buddie.displayName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
