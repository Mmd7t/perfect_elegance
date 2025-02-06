import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/profile/controllers/account_verified_controller.dart';

class AccountVerifiedView extends GetView<AccountVerifiedController> {
  const AccountVerifiedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "توثيق الحساب"),
      body: Obx(() {
        if (controller.appServices.isVerified.value) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: Get.width * 0.5,
                    child: "success.png".assetImage,
                  ),
                  "تم توثيق الحساب بالفعل".title(),
                ],
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: "التراخيص".titleSmall(),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: Get.width,
                  child: "اضف التراخيص الخاصه بمتجرك لتكون موثق".bodyMedium(),
                ),
                const SizedBox(height: 15),
                if (controller.file.value.path.isEmpty) ...{
                  ListTile(
                    title: "صورة جواز السفر".titleSmall(),
                    subtitle:
                        "يجب تصوير جواز السفر بشكل واضح نحو إضاءة واضحة. يجب ان يكون هناك قصاصة ورق عليها كلمة PE وتاريخ اليوم الي جانب جواز السفر عند تصويرهثائق الرسمية"
                            .bodyMedium(
                      color: Constants.cancel,
                    ),
                    titleAlignment: ListTileTitleAlignment.top,
                    trailing: IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: Constants.grey4.withValues(alpha: 0.3),
                      ),
                      onPressed: () {
                        ImagePicker picker = ImagePicker();
                        controller.appServices.pickImage(
                          () async {
                            Get.back();
                            XFile? f = await picker.pickImage(
                                source: ImageSource.camera);
                            if (f != null) {
                              controller.file.value = File(f.path);
                            }
                          },
                          () async {
                            Get.back();
                            XFile? f = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (f != null) {
                              controller.file.value = File(f.path);
                            }
                          },
                        );
                      },
                      icon: "upload".iconColored(size: 20),
                    ),
                  ).decorate(padding: 15),
                } else ...{
                  Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.file(controller.file.value).decorate(),
                          ),
                          Positioned.directional(
                            textDirection: TextDirection.rtl,
                            end: 10,
                            top: 10,
                            child: IconButton.filled(
                              onPressed: () {
                                controller.file.value = File('');
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: Constants.cancel,
                              ),
                              icon: "delete".iconColored(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GlobalButton(
                        onTap: () {
                          controller.verifyStore();
                        },
                        text: "توثيق",
                        width: Get.width,
                      ),
                    ],
                  ),
                },
              ],
            ),
          );
        }
      }),
    );
  }
}
