import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/agent_model.dart';
import 'package:flutter_pokedex/network/repository.dart';
import 'package:flutter_pokedex/page/agent_profile/agent_details.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ValorantAgent> listValorantAgent = [];

  Repository repository = Repository();

  getData() async {
    listValorantAgent = await repository.fetchValorantAgents();
    setState(() {});
  }

  List<ValorantAgent> listWithoutNullAgent = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        backgroundColor: HexColor('#0F1923'),
        title: const Text(
          'VALORANT AGENT',
          style: TextStyle(
            fontFamily: 'Valorant',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        childAspectRatio: 0.4,
        crossAxisCount: 2,
        primary: true,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        children: listValorantAgent
            .where((agent) => agent.isPlayableCharacter)
            .map((agent) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AgentProfile(agent: agent);
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              width: double.infinity,
              height: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 50,
                    left: 9,
                    width: 140,
                      child: Image.asset('assets/images/valorant-logo-outline.png', color: Colors.red,)),
                  Positioned(
                    left: -60,
                    width: 380,
                    child: Image.network(
                      agent.fullPortrait,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 4,
                    child: Text(
                      agent.displayName,
                      style: const TextStyle(
                        fontFamily: 'Valorant',
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
