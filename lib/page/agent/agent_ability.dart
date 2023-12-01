import 'package:flutter/material.dart';
import 'package:flutter_valorantagent/model/agent_model.dart';
import 'package:hexcolor/hexcolor.dart';

class AgentAbility extends StatelessWidget {
  const AgentAbility({super.key, required this.index, required this.agent});

  final ValorantAgent agent;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 19,
        left: 19,
        top: 10,
        bottom: 14,
      ),
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
            agent.abilities[index].displayName,
            style: const TextStyle(
                fontSize: 12, color: Colors.red, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 11),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                (agent.abilities[index].displayIcon),
                width: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                agent.abilities[index].description,
                style: const TextStyle(color: Colors.white),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
