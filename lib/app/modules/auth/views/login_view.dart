import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/auth/controllers/auth_controller.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "تسجيل الدخول".titleSmall(),
        centerTitle: true,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
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
                    child: "PE Seller".headline(color: Colors.white),
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
              SizedBox(
                width: Get.width,
                child: "أكمل التسجيل للبدء".body(color: Colors.black),
              ),
              const SizedBox(height: 30),
              GlobalTextField(
                hintText: "test@example.com",
                title: "البريد الالكتروني",
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "من فضلك ادخل البريد الالكتروني";
                  } else if (!value.isEmail) {
                    return "من فضلك ادخل البريد الالكتروني الصحيح";
                  } else {
                    return null;
                  }
                },
                onSaved: (p0) => controller.email.value = p0!,
              ),
              const SizedBox(height: 25),
              Obx(() {
                return GlobalTextField(
                  noBorder: true,
                  hintText: "**********",
                  title: "كلمة المرور",
                  inputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  filled: true,
                  suffixIcon: "eye",
                  obsecure: controller.isPassObsecure.value,
                  onSuffixTap: () => controller.isPassObsecure.value =
                      !controller.isPassObsecure.value,
                  onSaved: (p0) => controller.password.value = p0!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل كلمة المرور";
                    } else if (value.length < 6) {
                      return "من فضلك ادخل كلمة المرور التي تحتوي على 6 احرف او اكثر";
                    } else {
                      return null;
                    }
                  },
                );
              }),
              const SizedBox(height: 10),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: UnconstrainedBox(
                  child: InkWell(
                    onTap: () => Get.toNamed(Routes.forgetPass),
                    child: "نسيت كلمة المرور؟".button(),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              GlobalButton(
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();
                    controller.login();
                  }
                },
                text: "تسجيل الدخول",
                width: Get.width,
                height: 60,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "ليس لديك حساب؟  ".caption(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.signup);
                    },
                    child: "انشاء حساب".button(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
