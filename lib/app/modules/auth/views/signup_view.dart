import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/auth/controllers/auth_controller.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "تسجيل حساب جديد"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.signupFormKey,
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
              GlobalTextField(
                hintText: "test test",
                title: "الاسم بالكامل",
                inputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل الاسم";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.signupName.value = val!,
              ),
              const SizedBox(height: 10),
              GlobalTextField(
                hintText: "test@example.com",
                title: "البريد الالكتروني",
                inputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل البريد الالكتروني";
                  } else if (!val.isEmail) {
                    return "من فضلك ادخل بريد الكتروني صحيح";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.signupEmail.value = val!,
              ),
              const SizedBox(height: 10),
              GlobalTextField(
                hintText: "عنوان المتجر",
                title: "العنوان",
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل عنوان المتجر";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.signupAddress.value = val!,
              ),
              const SizedBox(height: 10),
              GlobalTextField(
                hintText: "123456789",
                title: "رقم الجوال",
                inputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل رقم الجوال";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.signupPhone.value = val!,
              ),
              const SizedBox(height: 10),
              GlobalTextField(
                hintText: "PE Store",
                title: "اسم المتجر",
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل اسم المتجر";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.signupStoreName.value = val!,
              ),
              const SizedBox(height: 10),
              GlobalTextField(
                hintText: "https://www.pe.ly",
                title: "لينك المتجر",
                inputType: TextInputType.url,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل لينك المتجر";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.signupStoreLink.value = val!,
              ),
              const SizedBox(height: 10),
              GlobalTextField(
                hintText: "123456789",
                title: "رقم جواز السفر",
                inputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل رقم جواز السفر";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.signupPassportNum.value = val!,
              ),
              const SizedBox(height: 10),
              GlobalTextField(
                hintText: "123456789",
                title: "الرقم القومي",
                inputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل الرقم القومي";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.signupIdNum.value = val!,
              ),
              const SizedBox(height: 10),
              Obx(() {
                return GlobalTextField(
                  controller: controller.passController,
                  noBorder: true,
                  hintText: "**********",
                  title: "كلمة المرور",
                  inputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  filled: true,
                  suffixIcon: "eye",
                  obsecure: controller.isSignupPassObsecure.value,
                  onSuffixTap: () => controller.isSignupPassObsecure.value =
                      !controller.isSignupPassObsecure.value,
                  onSaved: (p0) => controller.signupPass.value = p0!,
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
              Obx(() {
                return GlobalTextField(
                  noBorder: true,
                  hintText: "**********",
                  title: "تأكيد كلمة المرور",
                  inputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  filled: true,
                  suffixIcon: "eye",
                  obsecure: controller.isSignupConfirmPassObsecure.value,
                  onSuffixTap: () => controller.isSignupConfirmPassObsecure
                      .value = !controller.isSignupConfirmPassObsecure.value,
                  onSaved: (p0) => controller.signupPassConfirm.value = p0!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل كلمة المرور";
                    } else if (value != controller.passController.text) {
                      return "كلمتا المرور غير متطابقتان";
                    } else {
                      return null;
                    }
                  },
                );
              }),
              const SizedBox(height: 40),
              GlobalButton(
                onTap: () {
                  if (controller.signupFormKey.currentState!.validate()) {
                    controller.signupFormKey.currentState!.save();
                    controller.signup();
                  }
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
