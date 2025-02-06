import 'dart:io';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/profile/providers/profile_provider.dart';

class AccountVerifiedController extends GetxController {
  final ProfileProvider provider = Get.find<ProfileProvider>();
  final AppServices appServices = Get.find<AppServices>();

  Rx<File> file = File("").obs;
  verifyStore() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res =
        await provider.postStoreVerification(file.value);
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Get.back();
        appServices.setIsVerified(true);
        Ui.successGetBar(message: "تم توثيق المتجر بنجاح");
      }
    }
  }
}
