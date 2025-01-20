import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/profile/providers/profile_provider.dart';

class TermsController extends GetxController {
  final ProfileProvider provider = Get.find<ProfileProvider>();

  RxBool isLoading = false.obs;
  RxString content = "".obs;
  getTermsConditions() async {
    isLoading.value = true;
    final Map<String, dynamic>? res = await provider.getTerms();
    isLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        content.value = res['data']['content'];
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    getTermsConditions();
  }
}
