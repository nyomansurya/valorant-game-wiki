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
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(5),
        childAspectRatio: 0.6,
        crossAxisCount: 2,
        primary: true,
        mainAxisSpacing: 20,
        children: listValorantAgent.map(
          (agent) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AgentProfile(agent: agent);
                  },
                ));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(5),
                  color: HexColor('#141E29'),
                ),
                height: 500,
                width: 159,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      agent.displayName.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Expanded(
                      child: Image.network(
                        agent.fullPortrait,
                        // width: 100,
                        // height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
