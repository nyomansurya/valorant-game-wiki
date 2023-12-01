import 'package:flutter/material.dart';

class WeaponDescription extends StatelessWidget {
  const WeaponDescription({
    super.key,
    required this.title,
    required this.content,
    required this.isFireRate,
  });

  final bool isFireRate;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 1, style: BorderStyle.solid, color: Colors.white),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '$title :',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            isFireRate ? '$content ROUNDS/SEC' : content,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
