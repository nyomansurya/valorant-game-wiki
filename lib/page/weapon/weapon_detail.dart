import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/weapon_model.dart';
import 'package:flutter_valorantagent/page/weapon/weapon_description.dart';
import 'package:flutter_valorantagent/page/weapon/weapon_skins.dart';

class WeaponDetail extends StatelessWidget {
  const WeaponDetail({super.key, required this.weapon});

  final Weapons weapon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 311,
                  height: 220,
                  child: Center(
                    child: Image.network(weapon.displayIcon),
                  ),
                ),
                WeaponDescription(
                    title: 'TYPE',
                    content: weapon.shopData.category,
                    isFireRate: false),
                WeaponDescription(
                    title: 'CREEDS',
                    content: weapon.shopData.costData.toString(),
                    isFireRate: false),
                WeaponDescription(
                    title: 'MAGAZINE',
                    content: weapon.weaponStats.magazineSize.toString(),
                    isFireRate: false),
                WeaponDescription(
                    title: 'FIRE RATE',
                    content: weapon.weaponStats.fireRate.toString(),
                    isFireRate: true),
                const Text(
                  'DAMAGE',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: 350,
                  // height: 130,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'RANGE',
                                style: TextStyle(color: Colors.red),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${weapon.weaponStats.damageRange[0].rangeStartMeters} - ${weapon.weaponStats.damageRange[0].rangeEndMeters}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                          Column(
                            children: [
                              const Text(
                                'BODY',
                                style: TextStyle(color: Colors.red),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${weapon.weaponStats.damageRange[0].bodyDamage}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                          Column(
                            children: [
                              const Text(
                                'HEAD',
                                style: TextStyle(color: Colors.red),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                weapon.weaponStats.damageRange[0].headDamage
                                    .toStringAsFixed(2),
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          SizedBox(width: 50),
                          Column(
                            children: [
                              const Text(
                                'LEG',
                                style: TextStyle(color: Colors.red),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                weapon.weaponStats.damageRange[0].legDamage
                                    .toStringAsFixed(2),
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'SKINS',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: WeaponSkins(skins: weapon.skins),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
