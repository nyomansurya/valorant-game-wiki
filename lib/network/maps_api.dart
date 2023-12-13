import 'dart:convert';
import 'package:flutter_valorantagent/model/maps_model.dart';
import 'package:http/http.dart' as http;

class MapsApi {
  Future<List<Maps>> fetchMapsApi() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/maps'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<Maps> maps = [];

      for (var map in data) {
        // Cek jika narrativeDescription tidak null sebelum menambahkannya ke dalam daftar
        if (map['narrativeDescription'] != null) {
          maps.add(Maps.fromJson(map));
        }
      }

      return maps;
    } else {
      throw Exception('Failed to load Maps');
    }
  }
}
