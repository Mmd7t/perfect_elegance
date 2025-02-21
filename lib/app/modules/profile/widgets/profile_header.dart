import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: Get.size.shortestSide < 600 ? 40 : 70,
          backgroundColor: Constants.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: "logo.png".assetImage,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            name.titleSmall(color: Constants.secondary),
            email.bodyMedium(color: Constants.secondary),
          ],
        ),
      ],
    );
  }
}
