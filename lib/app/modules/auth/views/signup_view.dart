import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/auth/controllers/auth_controller.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "تسجيل حساب جديد"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                "مرحبا بك في".title(),
                const SizedBox(width: 10),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [
                        Color(0xFF5051F0),
                        Color(0xFFE8E9FF),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  child: "Perfect Elegance".headline(color: Colors.white),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Get.theme.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: "logo.png".assetImage,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const GlobalTextField(
              hintText: "test test",
              title: "الاسم بالكامل",
              inputType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            const GlobalTextField(
              hintText: "test@example.com",
              title: "البريد الالكتروني",
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            const GlobalTextField(
              hintText: "123456789",
              title: "رقم الجوال",
              inputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            const GlobalTextField(
              hintText: "123456789",
              title: "رقم الجوال",
              inputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            const GlobalTextField(
              hintText: "PE Store",
              title: "اسم المتجر",
              inputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            const GlobalTextField(
              noBorder: true,
              hintText: "**********",
              title: "كلمة المرور",
              inputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              filled: true,
              suffixIcon: "eye",
            ),
            const SizedBox(height: 10),
            const GlobalTextField(
              noBorder: true,
              hintText: "**********",
              title: "تأكيد كلمة المرور",
              inputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              filled: true,
              suffixIcon: "eye",
            ),
            const SizedBox(height: 40),
            GlobalButton(
              onTap: () {
                controller.appServices.isSignup.value = true;
                Get.toNamed(Routes.otpCode);
              },
              text: "تسجيل الحساب",
              width: Get.width,
              height: 60,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "لديك حساب بالفعل؟  ".caption(),
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: "تسجيل دخول".button()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
