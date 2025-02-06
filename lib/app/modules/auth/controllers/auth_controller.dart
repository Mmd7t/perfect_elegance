import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/error_response_model/error_response_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/auth/providers/auth_provider.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  final AuthProvider provider = Get.find<AuthProvider>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();

  RxString email = ''.obs;
  RxString password = ''.obs;

  RxBool isPassObsecure = true.obs;
  RxBool isSignupPassObsecure = true.obs;
  RxBool isSignupConfirmPassObsecure = true.obs;

  login() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postLogin(
      email: email.value,
      password: password.value,
      deviceToken: 'test',
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        appServices.saveAccessToken(res['data']['token']);
        Get.offNamed(Routes.stores);
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

  RxString signupName = ''.obs;
  RxString signupEmail = ''.obs;
  RxString signupAddress = ''.obs;
  RxString signupStoreLink = ''.obs;
  RxString signupPassportNum = ''.obs;
  RxString signupIdNum = ''.obs;
  RxString signupPhone = ''.obs;
  RxString signupStoreName = ''.obs;
  RxString signupPass = ''.obs;
  RxString signupPassConfirm = ''.obs;

  signup() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postStoreSignup(
      email: signupEmail.value,
      password: signupPass.value,
      managerName: signupName.value,
      name: signupStoreName.value,
      phone: signupPhone.value,
      address: signupAddress.value,
      storelink: signupStoreLink.value,
      passportNumber: signupPassportNum.value,
      idNumber: signupIdNum.value,
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Ui.successGetBar(message: res['data']['success']);
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

  @override
  void onClose() {
    super.onClose();
    passController.dispose();
  }
}
