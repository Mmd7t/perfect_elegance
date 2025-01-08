import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

import '../controllers/welcome_controller.dart';

class SplashView extends GetView<WelcomeController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.log(controller.isClosed.toString());
    return Scaffold(
      backgroundColor: Constants.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Constants.primary,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: Get.width * 0.5,
          height: Get.width * 0.5,
          child: "logo.png".assetImage,
        ),
      ),
    );
  }
}
