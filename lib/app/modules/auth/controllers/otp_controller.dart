import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';

class OtpController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  RxString otpCode = ''.obs;
}
