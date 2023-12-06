import 'dart:convert';
import 'package:flutter_valorantagent/model/rank_tier_model.dart';
import 'package:http/http.dart' as http;

class RankApi {
  Future<List<RankTier>> fetchRank() async {
    try {
      final response = await http.get(Uri.parse('https://valorant-api.com/v1/competitivetiers'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Check if 'data' exists and if it contains the expected tiers
        if (responseData.containsKey('data') && responseData['data'].length > 4 && responseData['data'][4].containsKey('tiers')) {
          final List<dynamic> data = responseData['data'][4]['tiers'];

          print(data);
          List<RankTier> ranks = [];

          for (var rank in data) {
            ranks.add(RankTier.fromJson(rank));
          }
          return ranks;
        } else {
          throw Exception('Data structure is not as expected');
        }
      } else {
        throw Exception('Failed to load ranks. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching data: $error');
    }
  }
}
