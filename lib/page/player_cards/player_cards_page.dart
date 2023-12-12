import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/player_cards_model.dart';
import 'package:flutter_valorantagent/network/playercards_api.dart';
import 'package:flutter_valorantagent/page/player_cards/player_cards_detail.dart';
import 'package:hexcolor/hexcolor.dart';

class PlayerCardsPage extends StatefulWidget {
  const PlayerCardsPage({super.key});

  @override
  State<PlayerCardsPage> createState() => _PlayerCardsPageState();
}

class _PlayerCardsPageState extends State<PlayerCardsPage> {
  List<PlayerCards> listPlayerCards = [];
  PlayerCardsApi playerCardsApi = PlayerCardsApi();

  getPlayerCards() async {
    listPlayerCards = await playerCardsApi.fetchPlayerCardsApi();
    setState(() {});
  }

  @override
  void initState() {
    getPlayerCards();
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
          'Player Cards',
          style: TextStyle(
            fontFamily: 'Valorant',
          ),
        ),
      ),
      body: GridView.count(
        childAspectRatio: 0.5,
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 0,
        children: listPlayerCards.map((card) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PlayerCardsDetail(imageUrl: card.largeArt, imageName: card.displayName);
                    },
                  ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
              ),
              child: Image.network(
                card.largeArt,
                fit: BoxFit.fill,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


//listPlayerCards.isNotEmpty ? listPlayerCards[0].displayName : ''