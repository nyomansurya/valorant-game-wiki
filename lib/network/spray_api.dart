import 'dart:convert';
import 'package:flutter_valorantagent/model/spray__model.dart';
import 'package:http/http.dart' as http;

class SprayApi {
  Future<List<Spray>> fetchSpray() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/sprays'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<Spray> sprays = [];

      for (var spray in data) {
        sprays.add(Spray.fromJson(spray));
      }
      return sprays;
    } else {
      throw Exception('Failed to load weapons');
    }
  }
}
