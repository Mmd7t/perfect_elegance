import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/enums/enums.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/city_model/city_model.dart';
import 'package:perfect_elegance/app/data/models/product_card_model.dart';
import 'package:perfect_elegance/app/data/models/product_model/product.dart';
import 'package:perfect_elegance/app/data/models/products_model/product.dart';
import 'package:perfect_elegance/app/data/models/products_model/products_model.dart';
import 'package:perfect_elegance/app/data/models/search_customer_model/search_customer_model.dart';
import 'package:perfect_elegance/app/modules/requests/providers/requests_provider.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class AddOrderController extends GetxController {
  final RequestsProvider provider = Get.find<RequestsProvider>();

  final GlobalKey<FormState> customerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> productFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addOrderFormKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  RxBool isCustomerLoading = false.obs;
  Rx<SearchCustomerModel> customer = SearchCustomerModel().obs;
  searchForCustomer() async {
    isCustomerLoading.value = true;
    customer = SearchCustomerModel().obs;
    Map<String, dynamic>? result =
        await provider.getSearchCustomer(phoneController.text);
    isCustomerLoading.value = false;
    if (result != null) {
      if (result['code'] == 200) {
        if ((result['data'] as Map<String, dynamic>).isEmpty) {
          Get.toNamed(Routes.addCustomer);
          Fluttertoast.showToast(
            msg: "لا يوجد عميل بهذا الرقم",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        } else {
          customer.value = SearchCustomerModel.fromJson(result['data']);
        }
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  RxString name = "".obs;
  RxString email = "".obs;
  RxString phone1 = "".obs;
  RxString phone2 = "".obs;
  RxString cityId = "".obs;
  RxString cityName = "".obs;
  RxString address = "".obs;
  addCustomer() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postNewCustomer(
      name: name.value,
      email: email.value,
      phone: phone1.value,
      phone2: phone2.value,
      address: address.value,
      cityId: cityId.value,
      cityName: cityName.value,
      socialType: "",
      socialLink: "",
      levelId: "",
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Get.back();
        customer.value = SearchCustomerModel.fromJson(res['data']['customer']);
      } else {
        Ui.errorGetBar(message: res['data']);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  TextEditingController skuController = TextEditingController();
  RxBool isProductLoading = false.obs;
  Rx<Product> product = Product().obs;
  RxList<ProductCardModel> products = <ProductCardModel>[].obs;
  RxInt currentProductIndex = 0.obs;

  Map<String, TextEditingController> textControllers = {};

  void addPurchaseProduct(ProductCardModel product) {
    if (!products.contains(product) &&
        products.where((e) => e.sku == product.sku).isEmpty) {
      products.add(product);
      products.toSet().toList().obs;

      // Initialize controllers for each field
      textControllers["${product.sku!}_size"] =
          TextEditingController(text: product.size ?? "");
      textControllers["${product.sku!}_color"] =
          TextEditingController(text: product.color ?? "");
      textControllers["${product.sku!}_purchasePrice"] =
          TextEditingController(text: product.dollarPurchasingPrice.toString());
      textControllers["${product.sku!}_sellingPrice"] =
          TextEditingController(text: product.dinarSellingPrice.toString());
      textControllers["${product.sku!}_quantity"] =
          TextEditingController(text: product.qty.toString());
    }
  }

  void removePurchaseProduct(int index) {
    String sku = products[index].sku!;

    // Dispose controllers related to this product
    textControllers["${sku}_size"]?.dispose();
    textControllers["${sku}_color"]?.dispose();
    textControllers["${sku}_purchasePrice"]?.dispose();
    textControllers["${sku}_sellingPrice"]?.dispose();
    textControllers["${sku}_quantity"]?.dispose();

    textControllers.remove("${sku}_size");
    textControllers.remove("${sku}_color");
    textControllers.remove("${sku}_purchasePrice");
    textControllers.remove("${sku}_sellingPrice");
    textControllers.remove("${sku}_quantity");
    products.removeAt(index);
  }

  searchForProduct() async {
    isProductLoading.value = true;
    product = Product().obs;
    final Map<String, dynamic>? result =
        await provider.getSearchProduct(skuController.text);
    isProductLoading.value = false;
    if (result != null) {
      if (result['code'] == 200) {
        if (result['data'] == null) {
          Get.toNamed(Routes.addNewProduct);
          Fluttertoast.showToast(
            msg: "المنتج غير موجود",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        } else {
          product.value = Product.fromJson(result['data']);
          log("Condition :: ${products.where((e) => e.sku == product.value.sku).isEmpty}");
          if (products.where((e) => e.sku == product.value.sku).isEmpty) {
            addPurchaseProduct(
              ProductCardModel(
                id: product.value.id!,
                sku: product.value.sku!,
                name: product.value.name!,
                qty: 0,
                dollarPurchasingPrice: 0.0,
                dinarSellingPrice: 0.0,
                totalPrice: 0.0,
                size: "",
                color: "",
              ),
            );
            skuController.clear();
            Fluttertoast.showToast(
              msg: "تم اضافة المنتج",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0,
            );
          } else {
            skuController.clear();
            Fluttertoast.showToast(
              msg: "المنتج مضاف بالفعل",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 16.0,
            );
          }

          Get.log("Products List :: ${products.toString()}");
        }
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  RxString productName = "".obs;
  RxString productLink = "".obs;
  RxString productSku = "".obs;

  addProduct() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postNewProduct(
      name: productName.value,
      link: productLink.value,
      sku: productSku.value,
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Get.back();
        product.value = Product.fromJson(res['data']['product']);
        log("Condition :: ${products.where((e) => e.sku == product.value.sku).isEmpty}");
        if (products.where((e) => e.sku == product.value.sku).isEmpty) {
          addPurchaseProduct(
            ProductCardModel(
              id: product.value.id!,
              sku: product.value.sku!,
              name: product.value.name!,
              qty: 0,
              dollarPurchasingPrice: 0.0,
              dinarSellingPrice: 0.0,
              totalPrice: 0.0,
              size: "",
              color: "",
            ),
          );
          skuController.clear();
          Fluttertoast.showToast(
            msg: "تم اضافة المنتج",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        } else {
          skuController.clear();
          Fluttertoast.showToast(
            msg: "المنتج مضاف بالفعل",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0,
          );
        }

        Get.log("Products List :: ${products.toString()}");
      } else {
        Ui.errorGetBar(message: res['data']);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  RxBool isCitiesLoading = false.obs;
  RxList<CityModel> cities = <CityModel>[].obs;
  getCities() async {
    isCitiesLoading.value = true;
    final Map<String, dynamic>? res = await provider.getCities();
    isCitiesLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        cities.value =
            res['data'].map<CityModel>((e) => CityModel.fromJson(e)).toList();
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  TextEditingController noteController = TextEditingController();
  TextEditingController depositValue = TextEditingController();
  RxBool isDeposit = false.obs;
  Rx<DeliveryOn> deliveryOn = DeliveryOn.init.obs;
  addStore() async {
    for (var e in products) {
      e.totalPrice = ((e.qty ?? 1) * (e.dollarPurchasingPrice ?? 0.0));
    }
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postStore(
      products: products.map((e) => e.toJson()).toList(),
      originalProducts: products
          .map(
            (e) => {
              "purchasing_price": e.dollarPurchasingPrice,
              "selling_price": e.dinarSellingPrice,
              "t_price": e.totalPrice,
            },
          )
          .toList(),
      customerId: customer.value.id.toString(),
      totalPrice: products.fold(0, (sum, product) {
        return sum + (product.totalPrice ?? 0.0);
      }),
      totalQty: products.fold(0, (sum, product) {
        return sum + (product.qty ?? 0);
      }),
      stikerNotes: noteController.text,
      deposit: isDeposit.value,
      deliveryOn: deliveryOn.value.toString(),
      totalDeposit: depositValue.text,
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Get.back();
        Ui.successGetBar(message: "تم اضافة الطلب بنجاح");
      } else {
        Ui.errorGetBar(message: res['data']);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  addSalesStore() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postStoreSalesOrder(
      products: chosenProducts.map((e) => e.toJson()).toList(),
      customerId: customer.value.id.toString(),
      totalPrice: chosenProducts.fold(0, (sum, product) {
        return sum + (product.dollarPurchasingPrice ?? 0.0);
      }),
      totalQty: products.fold(0, (sum, product) {
        return sum + (product.qty ?? 0);
      }),
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Get.back();
        Ui.successGetBar(message: "تم اضافة الطلب بنجاح");
      } else {
        Ui.errorGetBar(message: res['data']);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  RxBool isProductsLoading = false.obs;
  Rx<ProductsModel> procducts = ProductsModel().obs;
  getProducts() async {
    isProductsLoading.value = true;
    final Map<String, dynamic>? res = await provider.getProducts();
    isProductsLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        procducts.value = ProductsModel.fromJson(res['data']);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  RxList<SalesProduct> chosenProducts = <SalesProduct>[].obs;
  Map<String, TextEditingController> priceControllers = {};

  void addSalesProduct(SalesProduct product) {
    if (!chosenProducts.contains(product)) {
      chosenProducts.add(product);
      priceControllers[product.product!.sku!] =
          TextEditingController(text: product.dollarPurchasingPrice.toString());
    }
  }

  void deleteSalesProduct(int index) {
    String sku = chosenProducts[index].product!.sku!;
    priceControllers.remove(sku);
    priceControllers[sku]?.dispose();
    chosenProducts.removeAt(index);
  }

  @override
  void onReady() {
    super.onReady();
    getCities();
    getProducts();
  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    skuController.dispose();
    noteController.dispose();
    for (var controller in priceControllers.values) {
      controller.dispose();
    }
    priceControllers.clear();
    for (var controller in textControllers.values) {
      controller.dispose();
    }
    textControllers.clear();
  }
}
