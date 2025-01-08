import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              "No Internet".iconColored(size: Get.width * 0.5),
              const SizedBox(height: 40),
              "عفواً، لا يوجد اتصال بالإنترنت!".title(),
              const SizedBox(height: 25),
              "تأكد من تشغيل شبكة Wi-Fi أو البيانات\nالخلوية ثم حاول مرة أخرى."
                  .body(center: true),
              const SizedBox(height: 80),
              //TODO - Implement This try button
              GlobalButton(
                onTap: () {},
                text: "اعادة المحاولة",
                width: Get.width * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
