import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/order_details_model/order_details_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';
import 'package:perfect_elegance/app/modules/requests/providers/requests_provider.dart';

class OrderDetailsController extends GetxController {
  final RequestsProvider provider = Get.find<RequestsProvider>();
  final AppServices appServices = Get.find<AppServices>();
  final AddOrderController addOrderController = Get.find<AddOrderController>();

  RxBool isOrderLoading = false.obs;
  Rx<OrderDetailsModel> orderData = OrderDetailsModel().obs;
  Future<void> getOrderDetails() async {
    isOrderLoading.value = true;
    final Map<String, dynamic>? data =
        await provider.getShowOrder(appServices.orderId.value);

    if (data != null) {
      isOrderLoading.value = false;
      if (data['code'] == 200) {
        orderData.value = OrderDetailsModel.fromJson(data['data']);
      }
    } else {
      isOrderLoading.value = false;
    }
  }

  insertProduct() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postInsertProduct(
      orderId: orderData.value.id!.toString(),
      products: addOrderController.products.map((e) => e.toJson()).toList(),
      originalProducts: addOrderController.products
          .map(
            (e) => {
              "purchasing_price": e.dollarPurchasingPrice,
              "selling_price": e.dinarSellingPrice,
              "t_price": e.totalPrice,
            },
          )
          .toList(),
      totalQty: addOrderController.products.fold(0, (sum, product) {
        return sum + (product.qty ?? 0);
      }),
    );

    Get.back();

    if (res != null) {
      if (res['code'] == 200) {
        Get.back();
        getOrderDetails();
        Ui.successGetBar(message: "تم اضافةالمنتجات بنجاح");
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  deleteProduct(int productId) async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postDeleteProduct(
      productId,
      orderData.value.id!,
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Get.back();
        getOrderDetails();
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  TextEditingController sellingPrice = TextEditingController();
  TextEditingController purchasingPrice = TextEditingController();
  TextEditingController purchasingLink = TextEditingController();
  TextEditingController productSize = TextEditingController();
  TextEditingController productColor = TextEditingController();
  updateProduct(int productId) async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postUpdateProduct(
      productId,
      orderId: orderData.value.id!.toString(),
      size: productSize.text,
      color: productColor.text,
      purchaseLink: purchasingLink.text,
      sellingPrice: sellingPrice.text,
      purchasingPrice: purchasingPrice.text,
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Get.back();
        getOrderDetails();
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  @override
  void onReady() {
    getOrderDetails();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    sellingPrice.dispose();
    purchasingPrice.dispose();
    purchasingLink.dispose();
    productSize.dispose();
    productColor.dispose();
  }
}
