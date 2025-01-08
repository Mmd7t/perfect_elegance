import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';

class AuthProvider extends ApiProvider {
  // NOTE :- Get Tickets
  Future<Map<String, dynamic>?> getTickets() async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'tickets',
        headers: {'Accept': 'application/json'});
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.body as Map<String, dynamic>,
      };
    }
  }

  // NOTE :- Post Login
  Future<Map<String, dynamic>?> getShowTicket(int id) async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'tickets/$id/show',
        headers: {'Accept': 'application/json'});
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.body as Map<String, dynamic>,
      };
    }
  }
}
