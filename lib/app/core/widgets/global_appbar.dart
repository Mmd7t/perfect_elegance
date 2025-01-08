import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const GlobalAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
      ),
      title: title.title(),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight + 5);
}
