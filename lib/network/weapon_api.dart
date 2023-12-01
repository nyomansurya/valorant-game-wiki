import 'dart:convert';
import 'package:flutter_valorantagent/model/weapon_model.dart';
import 'package:http/http.dart' as http;

class WeaponApi {
  Future<List<Weapons>> fetchWeapon() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/weapons'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<Weapons> weapons = [];

      for (var weapon in data) {
        weapons.add(Weapons.fromJson(weapon));
      }
      return weapons;
    } else {
      throw Exception('Failed to load weapons');
    }
  }
}
