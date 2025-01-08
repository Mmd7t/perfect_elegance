import 'package:flutter/material.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class DetailCard extends StatelessWidget {
  final String? title;
  final String? leadingTitle;
  final String id;
  final Color? leadingColor;
  final List<Widget> subtitles;
  final List<Widget> subValues;
  const DetailCard({
    super.key,
    this.title,
    required this.id,
    this.leadingTitle,
    this.leadingColor,
    required this.subtitles,
    required this.subValues,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...{
          title!.titleSmall(),
          const SizedBox(height: 15),
        },
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (leadingTitle != null) ...{
              id.body(weight: FontWeight.bold, color: Colors.black),
            } else ...{
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                  color: Constants.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: id.titleSmall(color: Constants.primary),
              ),
            },
            if (leadingTitle != null) ...{
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                  color: leadingColor!.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: leadingTitle!.caption(color: leadingColor),
              ),
            },
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subtitles,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subValues,
              ),
            ),
          ],
        ),
      ],
    ).decorate(padding: 15);
  }
}
