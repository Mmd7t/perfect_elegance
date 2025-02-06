import 'dart:convert';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';

class RequestsProvider extends ApiProvider {
  // NOTE :- Post Store Without Deposit
  Future<Map<String, dynamic>?> postStore({
    required List products,
    required List originalProducts,
    required String customerId,
    required double totalPrice,
    required int totalQty,
    required String stikerNotes,
    required bool deposit,
    String totalDeposit = "",
    String deliveryOn = "",
  }) async {
    Get.log("Products List :: ${jsonEncode(products)}");
    Response res = await post(
      'orders/store',
      {
        'products': jsonEncode(products),
        'original_products': jsonEncode(originalProducts),
        'customer_id': customerId,
        'totalPrice': totalPrice,
        'totalQty': totalQty,
        'stiker_notes': stikerNotes,
        'delivery_provider': "vanex",
        'total_deposit': totalDeposit,
        'deposit': deposit,
        'delivery_on': deliveryOn,
      },
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
      },
    );
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

  // NOTE :- Post Store Without Deposit
  Future<Map<String, dynamic>?> postInsertProduct({
    required String orderId,
    required List products,
    required List originalProducts,
    required int totalQty,
  }) async {
    Response res = await post(
      'orders/addProduct',
      {
        'order_id': orderId,
        'products': jsonEncode(products),
        'original_products': jsonEncode(originalProducts),
        'totalQty': totalQty,
      },
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
      },
    );
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

  // NOTE :- GET Show Order
  Future<Map<String, dynamic>?> getShowOrder(int id) async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
      'orders/$id/get-data',
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
      },
    );
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

  // NOTE :- GET All Orders
  Future<Map<String, dynamic>?> getAllOrders({
    int page = 1,
    String orderId = "",
    String fromDate = "",
    String toDate = "",
    String status = "",
  }) async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'orders?page=$page&order_id=$orderId&fromdate=$fromDate&todate=$toDate&status=$status',
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${Get.find<AppServices>().accessToken.value}',
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

  // NOTE :- Post New Customer
  Future<Map<String, dynamic>?> postNewCustomer({
    required String name,
    required String email,
    required String phone,
    required String phone2,
    required String address,
    required String cityId,
    required String cityName,
    required String socialType,
    required String socialLink,
    required String levelId,
  }) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('customers/store', {
      'name': name,
      'email': email,
      'phone': phone,
      'phone2': phone2,
      'address': address,
      'city_id': cityId,
      'city_name': cityName,
      'social_type': socialType,
      'social_link': socialLink,
      'level_id': levelId
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

  // NOTE :- Post New Customer
  Future<Map<String, dynamic>?> postNewProduct({
    required String name,
    required String link,
    required String sku,
  }) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('products/store', {
      'name': name,
      'gender': "",
      'category': "",
      'aed_exchange': "",
      'price_dollar': "",
      'sell_factor': "",
      'purchases_link': link,
      'type': "",
      'sku': sku,
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

  // NOTE :- Post New Customer
  Future<Map<String, dynamic>?> getSearchCustomer(String phone) async {
    Response<Map<String, dynamic>?> res =
        await get<Map<String, dynamic>?>('customers/search?q=$phone', headers: {
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

  // NOTE :- Post New Customer
  Future<Map<String, dynamic>?> getSearchProduct(String sku) async {
    Response<Map<String, dynamic>?> res =
        await get<Map<String, dynamic>?>('products/search?q=$sku', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.body,
      };
    }
  }

  // NOTE :- Get Cities
  Future<Map<String, dynamic>?> getCities() async {
    Response res = await get('cities', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.statusCode == 200 ? res.body as List<dynamic> : res.body,
      };
    }
  }

  // NOTE :- Post New Customer
  Future<Map<String, dynamic>?> postDeleteProduct(
      int productId, int orderId) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('orders/product/$productId/delete', {
      "order_id": orderId
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

  // NOTE :- Post New Customer
  Future<Map<String, dynamic>?> postUpdateProduct(
    int productId, {
    String size = "",
    String color = "",
    required String sellingPrice,
    required String purchasingPrice,
    required String orderId,
    required String purchaseLink,
  }) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('orders/product/$productId/update', {
      "order_id": orderId,
      "size": size,
      "color_name": color,
      "dinar_selling_price": sellingPrice,
      "dollar_purchasing_price": purchasingPrice,
      "purchases_link": purchaseLink,
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
