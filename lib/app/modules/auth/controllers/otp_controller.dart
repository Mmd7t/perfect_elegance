import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/error_response_model/error_response_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/auth/providers/auth_provider.dart';
import 'package:perfect_elegance/app/modules/auth/widgets/reset_pass_dialog.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class OtpController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgetPassFormKey = GlobalKey<FormState>();
  final AuthProvider provider = Get.find<AuthProvider>();
  RxString otpCode = ''.obs;
  RxString otpToken = ''.obs;
  RxString email = ''.obs;

  RxBool obsecureNewPass = true.obs;
  RxBool obsecureConfirmNewPass = true.obs;
  RxString newPassword = ''.obs;
  RxString confirmNewPassword = ''.obs;
  final GlobalKey<FormState> resetPassFormKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();

  forgetPassword({bool retry = false}) async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res =
        await provider.postResetPassOtp(email: email.value);
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        if (!retry) {
          Get.toNamed(Routes.otpCode);
        }
      } else if (res['code'] == 422) {
        ErrorResponseModel errorResponse =
            ErrorResponseModel.fromJson(res['data']);
        Ui.errorGetBar(
          message: errorResponse.errors!.values
              .map((e) => '$e')
              .join('\n')
              .replaceAll(RegExp(r'[\[\]]'), ''),
        );
      }
    } else {
      Ui.errorGetBar(message: "خطأ في الخادم");
    }
  }

  verifyOtp() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res =
        await provider.postVerifyOtp(email: email.value, otp: otpCode.value);
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        otpToken.value = res['data']['token'];
        Ui.successGetBar(message: res['data']['message']);
        Get.toNamed(Routes.resetPass);
      } else if (res['code'] == 400) {
        Ui.errorGetBar(
          message: res['data']['error'],
        );
      }
    } else {
      Ui.errorGetBar(message: "خطأ في الخادم");
    }
  }

  Future<void> resetPass() async {
    Ui.loadingDialog();
    int? data = await provider.postResetPass(
      email: email.value,
      password: newPassword.value,
      confirmPassword: confirmNewPassword.value,
      token: otpToken.value,
    );
    Get.back();
    if (data != null) {
      if (data == 200) {
        Get.generalDialog(
          barrierColor: Constants.black3.withValues(alpha: 0.2),
          transitionDuration: Durations.extralong2,
          transitionBuilder: (context, animation, secondaryAnimation, child) =>
              child.dialogTransition(animation),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ResetPassDialog(),
        );
      } else {
        if (data == 403) {
          Ui.errorGetBar(message: "يوجد خطأ في رمز التفعيل");
        } else {
          Ui.errorGetBar(message: "خطأ في رمز التفعيل");
        }
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  @override
  void onClose() {
    passController.dispose();
    super.onClose();
  }
}
