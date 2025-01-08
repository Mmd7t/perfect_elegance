import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';

class RequestsProvider extends ApiProvider {
  // NOTE :- Post Store Without Deposit
  Future<Map<String, dynamic>?> postStoreWithoutDeposit(
      {required String products,
      required String originalProducts,
      required String customerId,
      required String totalPrice,
      required String totalQty,
      required String stikerNotes,
      required String totalDeposit,
      required String deposit,
      required String deliveryProvider,
      required String deliveryOn,
      required String id}) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('orders/store', {
      'products': products,
      'original_products': originalProducts,
      'customer_id': customerId,
      'totalPrice': totalPrice,
      'totalQty': totalQty,
      'stiker_notes': stikerNotes,
      'total_deposit': totalDeposit,
      'deposit': deposit,
      'delivery_provider': deliveryProvider,
      'delivery_on': deliveryOn,
      'id': id
    }, headers: {
      'Accept': 'application/json'
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

  // NOTE :- Post Store With Deposit
  Future<Map<String, dynamic>?> postStoreWithDeposit(
      {required String products,
      required String originalProducts,
      required String customerId,
      required String totalPrice,
      required String totalQty,
      required String stikerNotes,
      required String totalDeposit,
      required String deposit,
      required String deliveryProvider,
      required String deliveryOn,
      required String id}) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('orders/store', {
      'products': products,
      'original_products': originalProducts,
      'customer_id': customerId,
      'totalPrice': totalPrice,
      'totalQty': totalQty,
      'stiker_notes': stikerNotes,
      'total_deposit': totalDeposit,
      'deposit': deposit,
      'delivery_provider': deliveryProvider,
      'delivery_on': deliveryOn,
      'id': id
    }, headers: {
      'Accept': 'application/json'
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

  // NOTE :- Post Add Product
  Future<Map<String, dynamic>?> postAddProduct(
      {required String orderId}) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('orders/addProduct', {
      'order_id': orderId,
    }, headers: {
      'Accept': 'application/json'
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

  // NOTE :- GET Show Order
  Future<Map<String, dynamic>?> getShowOrder(int id) async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'orders/$id/get-data',
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

  // NOTE :- GET All Orders
  Future<Map<String, dynamic>?> getAllOrders() async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'orders',
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
