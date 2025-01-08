import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class AccountVerifiedView extends GetView {
  const AccountVerifiedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "توثيق الحساب"),
      body: SingleChildScrollView(
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
            ListTile(
              title: "صورة جواز السفر".titleSmall(),
              subtitle:
                  "يجب تصوير جواز السفر بشكل واضح نحن إضاءة واضحة. يجب ان يكون هناك قصاصة ورق عليها كلمة PE وتاريخ اليوم الي جانب جواز السفر عند تصويرهثائق الرسمية"
                      .bodyMedium(
                color: Constants.cancel,
              ),
              titleAlignment: ListTileTitleAlignment.top,
              trailing: CircleAvatar(
                backgroundColor: Constants.grey5,
                child: "upload".iconColored(size: 20),
              ),
            ).decorate(padding: 15),
          ],
        ),
      ),
    );
  }
}
