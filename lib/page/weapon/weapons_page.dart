import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/weapon_model.dart';
import 'package:flutter_valorantagent/network/weapon_api.dart';
import 'package:flutter_valorantagent/page/weapon/weapon_detail.dart';
import 'package:hexcolor/hexcolor.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({super.key});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  List<Weapons> listWeapon = [];

  WeaponApi weaponAPI = WeaponApi();

  getWeapon() async {
    listWeapon = await weaponAPI.fetchWeapon();
    setState(() {});
  }

  @override
  void initState() {
    getWeapon();
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
          'Weapons',
          style: TextStyle(
            fontFamily: 'Valorant',
          ),
        ),
      ),
      body: ListView(
          children: listWeapon.map(
        (weapon) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WeaponDetail(weapon: weapon);
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 22, horizontal: 33),
              width: 309,
              height: 128,
              decoration: BoxDecoration(
                border: Border.all(
                  color: HexColor('#FF4655'),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      weapon.displayIcon,
                      width: 150,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 28,
                    decoration: BoxDecoration(
                      color: HexColor('#FF4655'),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            weapon.displayName,
                            style: TextStyle(
                              fontFamily: 'Valorant',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Image.asset('assets/images/arrow.png'),
                        const SizedBox(width: 11)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ).toList()),
    );
  }
}
