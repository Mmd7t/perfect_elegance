import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/profile/controllers/policy_controller.dart';
import 'package:perfect_elegance/app/modules/profile/providers/profile_provider.dart';

class PolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileProvider>(() => ProfileProvider());
    Get.lazyPut<PolicyController>(() => PolicyController());
  }
}
