import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';

class TicketsProvider extends ApiProvider {
  // NOTE :- Get All Tickets
  Future<Map<String, dynamic>?> getAllTickets() async {
    Response<Map<String, dynamic>?> res =
        await get<Map<String, dynamic>?>('tickets', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
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

  // NOTE :- Get Show Ticket
  Future<Map<String, dynamic>?> getShowTicket(int id) async {
    Response<Map<String, dynamic>?> res =
        await get<Map<String, dynamic>?>('tickets/$id/show', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
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

  // NOTE :- Post Store
  Future<Map<String, dynamic>?> postStore(
      {required String title,
      required String body,
      required String priority,
      required String management,
      required String packageCode}) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('tickets/store', {
      'title': title,
      'body': body,
      'priority': priority,
      'management': management,
      'package_code': packageCode
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
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

  // NOTE :- Post Add Reply To Ticket
  Future<Map<String, dynamic>?> postAddReplyToTicket(
      {required String reply, required int statusId, required int id}) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('tickets/$id/addReply', {
      'reply': reply,
      'status_id': statusId
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
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

  // NOTE :- Put Update
  Future<Map<String, dynamic>?> putUpdate(
      {required String title,
      required String body,
      required String priority,
      required int id}) async {
    Response<Map<String, dynamic>?> res =
        await put<Map<String, dynamic>?>('tickets/$id/update', {
      'title': title,
      'body': body,
      'priority': priority
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
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
