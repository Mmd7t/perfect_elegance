import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class ResetPassDialog extends StatelessWidget {
  const ResetPassDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            width: Get.width * 0.78,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withValues(alpha: 0.7)),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withValues(alpha: 0.3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: 'success.png'.assetImage,
                  ),
                  const SizedBox(height: 30),
                  'تم تغيير كلمة المرور!'.title(),
                  const SizedBox(height: 10),
                  'تمت إعادة تعيين كلمة المرور الخاصة بك، يمكنك الآن تسجيل الدخول مرة أخرى إلى حسابك في perfect elegant'
                      .bodyMedium(),
                  const SizedBox(height: 30),
                  GlobalButton(
                    width: double.infinity,
                    onTap: () {
                      Get.back();
                      Get.offNamedUntil(
                          Routes.login, (route) => route.isCurrent);
                    },
                    text: 'العودة لتسجيل الدخول',
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
