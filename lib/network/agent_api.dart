import 'dart:convert';
import 'package:flutter_valorantagent/model/agent_model.dart';
import 'package:http/http.dart' as http;

class AgentApi {
  Future<List<ValorantAgent>> fetchValorantAgents() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/agents'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<ValorantAgent> agents = [];

      for (var agent in data) {
        agents.add(ValorantAgent.fromJson(agent));
      }

      return agents;
    } else {
      throw Exception('Failed to load agents');
    }
  }
}
