import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/rank_tier_model.dart';
import 'package:flutter_valorantagent/page/rank/rank_container.dart';

class RankList extends StatelessWidget {
  const RankList({super.key, required this.listRank});

  final List<RankTier> listRank;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[0].divisionName : '',
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 0, listRank: listRank),
              ],
            ),
            // IRON
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[3].divisionName : '',
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 3, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 4, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 5, listRank: listRank),
              ],
            ),
            // BRONZE
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[6].divisionName : '',
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 6, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 7, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 8, listRank: listRank),
              ],
            ),
            //SILVER
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[9].divisionName : '',
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 9, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 10, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 11, listRank: listRank),
              ],
            ),
            //GOLD
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[12].divisionName : '',
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 12, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 13, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 14, listRank: listRank),
              ],
            ),
            //PLATINUM
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[15].divisionName : '',
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 15, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 16, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 17, listRank: listRank),
              ],
            ),
            //DIAMOND
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[18].divisionName : '',
              style: const TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 18, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 19, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 20, listRank: listRank),
              ],
            ),
            //ASCENDANT
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[21].divisionName : '',
              style: const TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 21, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 22, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 23, listRank: listRank),
              ],
            ),
            //IMMORTAL
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[24].divisionName : '',
              style: const TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 24, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 25, listRank: listRank),
                const SizedBox(width: 15),
                RankContainer(index: 26, listRank: listRank),
              ],
            ),
            //RADIANT
            const SizedBox(height: 21),
            Text(
              listRank.isNotEmpty ? listRank[27].divisionName : '',
              style: const TextStyle(
                fontFamily: 'Valorant',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RankContainer(index: 27, listRank: listRank),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
