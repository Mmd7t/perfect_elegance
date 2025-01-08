import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import '../services/app_services.dart';

class ApiProvider extends GetConnect {
  final AppServices appServices = Get.put<AppServices>(AppServices());

  @override
  void onInit() {
    super.onInit();
    Get.log('ACCESS TOKEN :::: ${appServices.accessToken.value}');
    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = const Duration(seconds: 120);
    httpClient.addResponseModifier((request, response) async {
      Get.log(
          '================================headers================================');
      Get.log(request.headers.toString());
      Get.log(request.url.toString());
      Get.log(request.headers['Authorization'].toString());
      Get.log(response.body.toString());
      Get.log(request.method.toString());
      return response;
    });
  }

  Future<Request> requestInterceptor(Request request) async {
    return request;
  }
}
