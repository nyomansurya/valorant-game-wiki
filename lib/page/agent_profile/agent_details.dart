import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/agent_model.dart';
import 'package:hexcolor/hexcolor.dart';

class AgentProfile extends StatelessWidget {
  const AgentProfile({super.key, required this.agent});

  final ValorantAgent agent;

  @override
  Widget build(BuildContext context) {
    List<Widget> abilitiesWidgets = [
      for (var ability in agent.abilities)
        Container(
          padding:
              const EdgeInsets.only(right: 19, left: 19, top: 10, bottom: 14),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
            color: HexColor('#141E29'),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ability.displayName,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 11),
              Row(
                children: [
                  Image.network((ability.displayIcon), width: 35),
                  SizedBox(width: 10,),
                  Expanded(child: Text(ability.description, style: TextStyle(
                    color: Colors.white
                  ),))
                ],
              ),
            ],
          ),
        ),
    ];

    return Scaffold(
      backgroundColor: HexColor('#0F1923'),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 30,
                  child: Image.network(
                    agent.background,
                    width: 200,
                  ),
                ),
                Positioned(
                    child: Image.network(
                  agent.fullPortrait,
                )),
              ],
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
              margin: EdgeInsets.only(left: 20),
              child: const Text(
                'ABILITIES',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...abilitiesWidgets
          ],
        ),
      ]),
    );
  }
}
