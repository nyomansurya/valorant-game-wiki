import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/rank_tier_model.dart';
import 'package:hexcolor/hexcolor.dart';

class RankContainer extends StatelessWidget {
  const RankContainer({super.key, required this.index, required this.listRank});

  final int index;
  final List<RankTier> listRank;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 100,
      height: 150,
      decoration: BoxDecoration(
          color: HexColor('#141E29'),
          border: Border.all(width: 1, color: Colors.red)),
      child: Column(
        children: [
          Expanded(
            child: Image.network(listRank.isNotEmpty
                ? listRank[index].icon
                : 'https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/0/largeicon.png'),
          ),
          Text(
            listRank.isNotEmpty ? listRank[index].tierName : 'UNRANKED',
            style: const TextStyle(
              fontFamily: 'Valorant',
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
