import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/agent_model.dart';
import 'package:flutter_pokedex/page/agent_profile/agent_ability.dart';
import 'package:hexcolor/hexcolor.dart';

class AgentProfile extends StatelessWidget {
  const AgentProfile({super.key, required this.agent});

  final ValorantAgent agent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 50.0), // Adjust the position as needed
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10))),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor: HexColor('#0F1923'),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 15,
                    child: Image.network(
                      agent.background,
                      width: 300,
                    ),
                  ),
                  Positioned(
                      width: 500,
                      left: 2,
                      child: Image.network(
                        agent.fullPortrait,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 64),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1, style: BorderStyle.solid, color: Colors.white),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'DESCRIPTION:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    agent.description.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'ABILITIES',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AgentAbility(index: 0, agent: agent),
            AgentAbility(index: 1, agent: agent),
            AgentAbility(index: 2, agent: agent),
            AgentAbility(index: 3, agent: agent),
          ],
        ),
      ]),
    );
  }
}
