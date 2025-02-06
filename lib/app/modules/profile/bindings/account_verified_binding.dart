import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/profile/controllers/account_verified_controller.dart';
import 'package:perfect_elegance/app/modules/profile/providers/profile_provider.dart';

class AccountVerifiedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<AccountVerifiedController>(() => AccountVerifiedController());
  }
}
