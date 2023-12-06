import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/rank_tier_model.dart';
import 'package:flutter_valorantagent/network/rank_api.dart';
import 'package:flutter_valorantagent/page/rank/rank_list.dart';
import 'package:hexcolor/hexcolor.dart';

class RanksPage extends StatefulWidget {
  const RanksPage({super.key});

  @override
  State<RanksPage> createState() => _RanksPageState();
}

class _RanksPageState extends State<RanksPage> {
  List<RankTier> listRank = [];
  RankApi rankApi = RankApi();

  getRank() async {
    listRank = await rankApi.fetchRank();
    setState(() {});
  }

  @override
  void initState() {
    getRank();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('#0F1923'),
        title: const Text(
          'Ranks',
          style: TextStyle(
            fontFamily: 'Valorant',
          ),
        ),
      ),
      body: 
      // ElevatedButton(onPressed: () {
      //   print(listRank);
      // }, child: Text('Print list Rank')) 
      RankList(listRank: listRank)
    );
  }
}

//listRank[3].tierName
