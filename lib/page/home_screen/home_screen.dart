import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/page/agent/agent_page.dart';
import 'package:flutter_valorantagent/page/gun_buddies/gun_buddies_page.dart';
import 'package:flutter_valorantagent/page/home_screen/home_screen_menu.dart';
import 'package:flutter_valorantagent/page/maps_page.dart';
import 'package:flutter_valorantagent/page/player_cards/player_cards_page.dart';
import 'package:flutter_valorantagent/page/rank/ranks_page.dart';
import 'package:flutter_valorantagent/page/spray/sprays_page.dart';
import 'package:flutter_valorantagent/page/weapon/weapons_page.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('#0F1923'),
        title: const Text(
          'Main Menu',
          style: TextStyle(
            fontFamily: 'Valorant',
          ),
        ),
      ),
      body: ListView(
        children: const [
          HomeScreenMenu(
            title: 'AGENT',
            imagePath: 'assets/images/agents.png',
            destinationPage: AgentListPage(),
          ),
          HomeScreenMenu(
            title: 'weapons',
            imagePath: 'assets/images/weapons.png',
            destinationPage: WeaponsPage(),
          ),
          HomeScreenMenu(
            title: 'ranks',
            imagePath: 'assets/images/ranks.png',
            destinationPage: RanksPage(),
          ),
          HomeScreenMenu(
            title: 'sprays',
            imagePath: 'assets/images/sprays.png',
            destinationPage: SpraysPage(),
          ),
          HomeScreenMenu(
            title: 'player\ncards',
            imagePath: 'assets/images/player-cards.png',
            destinationPage: PlayerCardsPage(),
          ),
          HomeScreenMenu(
            title: 'maps',
            imagePath: 'assets/images/maps.png',
            destinationPage: MapsPage(),
          ),
          HomeScreenMenu(
            title: 'gun\nbuddies',
            imagePath: 'assets/images/gunbuddies.png',
            destinationPage: GunBuddiesPage(),
          ),
        ],
      ),
    );
  }
}
