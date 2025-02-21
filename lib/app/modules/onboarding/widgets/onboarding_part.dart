import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class OnboardingPart extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const OnboardingPart({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        image.iconColored(
            size: Get.size.shortestSide < 600
                ? Get.width * 0.75
                : Get.width * 0.5),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title.title(color: Colors.white),
              const SizedBox(height: 10),
              subtitle.bodyMedium(color: Colors.white70, center: true),
            ],
          ),
        ),
      ],
    );
  }
}
