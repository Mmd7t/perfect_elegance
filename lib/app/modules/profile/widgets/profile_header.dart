import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/profile/controllers/profile_controller.dart';

class ProfileHeader extends GetWidget<ProfileController> {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Constants.primary,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 36,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipOval(
                child: "".image(),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        "Salma Ahmed".titleSmall(color: Constants.secondary),
      ],
    );
  }
}
