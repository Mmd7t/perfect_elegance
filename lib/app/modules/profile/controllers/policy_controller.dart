import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/models/policy_model/datum.dart';
import 'package:perfect_elegance/app/data/models/policy_model/policy_model.dart';
import 'package:perfect_elegance/app/modules/profile/providers/profile_provider.dart';

class PolicyController extends GetxController {
  final ProfileProvider provider = Get.find<ProfileProvider>();

  RxBool isLoading = false.obs;
  RxList<PolicyDatum> data = <PolicyDatum>[].obs;
  getPolicies() async {
    isLoading.value = true;
    final Map<String, dynamic>? res = await provider.getPolicy();
    isLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        data.value = PolicyModel.fromJson(res['data']).polices!.data;
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPolicies();
  }
}
