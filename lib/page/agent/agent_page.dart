import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/agent_model.dart';
import 'package:flutter_valorantagent/network/agent_api.dart';
import 'package:flutter_valorantagent/page/agent/agent_details.dart';
import 'package:hexcolor/hexcolor.dart';

class AgentListPage extends StatefulWidget {
  const AgentListPage({super.key});

  @override
  State<AgentListPage> createState() => _AgentListPageState();
}

class _AgentListPageState extends State<AgentListPage> {
  List<ValorantAgent> listValorantAgent = [];

  AgentApi agentApi = AgentApi();

  getAgent() async {
    listValorantAgent = await agentApi.fetchValorantAgents();
    setState(() {});
  }

  @override
  void initState() {
    getAgent();
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
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        childAspectRatio: 0.6,
        crossAxisCount: 2,
        primary: true,
        mainAxisSpacing: 10,
        crossAxisSpacing: 2,
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
                      child: Image.asset(
                        'assets/images/valorant-logo-outline.png',
                        color: Colors.red,
                      )),
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
                        fontSize: 16,
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
