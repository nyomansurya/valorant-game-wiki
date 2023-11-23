import 'dart:convert';
import 'package:flutter_pokedex/model/agent_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<ValorantAgent>> fetchValorantAgents() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/agents'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<ValorantAgent> agents = [];

      for (var agent in data) {
        agents.add(ValorantAgent.fromJson(agent));
      }
      
      // print(agents);

      return agents;
      // Lakukan apa pun yang diperlukan dengan daftar agen yang diambil dari API
      // Misalnya, tampilkan informasi agen atau lakukan sesuatu yang lain.
    } else {
      throw Exception('Failed to load agents');
    }
  }
}
