import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/main/controllers/stores_controller.dart';
import 'package:perfect_elegance/app/modules/main/providers/home_provider.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<StoresController>(() => StoresController());
  }
}
