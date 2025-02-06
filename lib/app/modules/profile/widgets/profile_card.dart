import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String icon;
  final String route;
  final bool isLogout;
  final VoidCallback? onTap;
  const ProfileCard({
    super.key,
    required this.title,
    this.subtitle,
    this.isLogout = false,
    this.onTap,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      onTap: isLogout ? onTap : () => Get.toNamed(route),
      tileColor: Constants.grey5.withValues(alpha: 0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: title.body(
        color: isLogout ? Constants.cancel : Get.theme.colorScheme.secondary,
        weight: isLogout ? FontWeight.bold : FontWeight.normal,
      ),
      subtitle: subtitle?.bodyMedium(color: Constants.grey3),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 20,
      ),
      leading: icon.iconColored(),
    );
  }
}
