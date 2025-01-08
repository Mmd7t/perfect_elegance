import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/auth/controllers/otp_controller.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class ResetPassword extends GetView<OtpController> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "انشاء كلمة مرور جديدة"),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SizedBox(
                        width: 100,
                        child: 'lock.png'.assetImage,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'انشاء كلمة مرور جديدة'
                              .titleSmall(color: Constants.black2),
                          const SizedBox(height: 5),
                          'يرجى إنشاء كلمة المرور الجديدة لحسابك على\nperfect elegance'
                              .bodyMedium(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Form(
                      child: Center(
                        child: Column(
                          children: [
                            GlobalTextField(
                              hintText: "******************",
                              title: "كلمة المرور الجديدة",
                              suffixIcon: 'eye',
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return "من فضلك أدخل كلمة المرور";
                                } else if (val.length < 6) {
                                  return "كلمة المرور يجب أن تكون أكثر من 6 خانات";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            const GlobalTextField(
                              hintText: "******************",
                              title: "تأكيد كلمة المرور الجديدة",
                              suffixIcon: 'eye',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  GlobalButton(
                    onTap: () {
                      // if (controller.resetPassFormKey.currentState!
                      //     .validate()) {
                      //   controller.resetPassFormKey.currentState!.save();
                      //   controller.resetPass();
                      // }
                      Get.offNamedUntil(Routes.login, (route) => false);
                    },
                    text: 'اعادة التعيين',
                    width: context.width * 0.95,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
