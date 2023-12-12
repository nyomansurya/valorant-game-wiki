import 'dart:convert';
import 'package:flutter_valorantagent/model/player_cards_model.dart';
import 'package:http/http.dart' as http;

class PlayerCardsApi {
  Future<List<PlayerCards>> fetchPlayerCardsApi() async {
    final response =
        await http.get(Uri.parse('https://valorant-api.com/v1/playercards'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      List<PlayerCards> playerCards = [];

      for (var card in data) {
        playerCards.add(PlayerCards.fromJson(card));
      }

      return playerCards;
    } else {
      throw Exception('Failed to load agents');
    }
  }
}