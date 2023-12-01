import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/weapon_model.dart';

class WeaponSkins extends StatelessWidget {
  const WeaponSkins({Key? key, required this.skins});

  final List<Skins> skins;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: skins.map(
          (skin) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child: Container(
                margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                width: 125,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                ),
                child: Image.network(
                  skin.displayIcon ?? '',
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text('Image Not Available'),
                    );
                  },
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
