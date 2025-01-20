import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/profile/providers/profile_provider.dart';

class ProfileController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  final ProfileProvider provider = Get.find<ProfileProvider>();
}
