import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/profile/providers/profile_provider.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  final ProfileProvider provider = Get.find<ProfileProvider>();
  RxBool isNotificationsChecked = true.obs;

  unsubscribe() async {
    Ui.loadingDialog();
    final int? res = await provider.postUnsubscribe();

    Get.back();

    if (res != null) {
      if (res == 200) {
        Ui.successGetBar(message: "تم حذف حسابك");
        appServices.removeUserData();
        Get.offAllNamed(Routes.login);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }
}
