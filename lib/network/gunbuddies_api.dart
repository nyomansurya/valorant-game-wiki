import 'dart:convert';
import 'package:flutter_valorantagent/model/gunbuddies_model.dart';
import 'package:http/http.dart' as http;

class GunBuddiesApi {

  Future<List<GunBuddies>> fetchGunBuddiesApi() async {
    final response = await http.get(Uri.parse('https://valorant-api.com/v1/buddies'));

  if (response.statusCode == 200){
    final List<dynamic> data = json.decode(response.body)['data'];
    List<GunBuddies> buddies = [];

    for (var buddie in data){
      buddies.add(GunBuddies.fromJson(buddie));
    } 
    return buddies;
  } else {
    throw Exception('Failed to load buddies');
  }

  }

}