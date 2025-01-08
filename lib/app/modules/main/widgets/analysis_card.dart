import 'package:flutter/material.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class AnalysisCard extends StatelessWidget {
  final Color color;
  final String title;
  final String number;
  final String icon;
  const AnalysisCard({
    super.key,
    required this.color,
    required this.title,
    required this.number,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadiusDirectional.horizontal(
              start: Radius.circular(10),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              number.title(),
              const SizedBox(height: 5),
              title.caption(weight: FontWeight.bold),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: color,
          child: icon.iconColored(size: 18),
        ),
        const SizedBox(width: 10),
      ],
    ).decorate();
  }
}
