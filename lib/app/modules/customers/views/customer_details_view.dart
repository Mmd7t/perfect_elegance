import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class CustomerDetailsView extends GetView {
  const CustomerDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "بيانات الزبائن"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Salma Ahmed".titleSmall(),
                    "block".iconColored(),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "تاريخ الانشاء:".bodyMedium(),
                          const SizedBox(height: 8),
                          "رقم الهاتف:".bodyMedium(),
                          const SizedBox(height: 8),
                          "المدينة:".bodyMedium(),
                          const SizedBox(height: 8),
                          "العنوان:".bodyMedium(),
                          const SizedBox(height: 8),
                          "عدد الطلبيات:".bodyMedium(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "24-12-2024".subtitle(),
                          const SizedBox(height: 8),
                          "+20 1022 2322 22".subtitle(),
                          const SizedBox(height: 8),
                          "طرابلس".subtitle(),
                          const SizedBox(height: 8),
                          "طرابلس".subtitle(),
                          const SizedBox(height: 8),
                          "4".subtitle(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ).decorate(padding: 15),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width,
              child: "الطلبيات".titleSmall(),
            ),
            const SizedBox(height: 10),
            DetailCard(
              id: "#1001",
              leadingTitle: "قائمة",
              leadingColor: Constants.pending,
              subtitles: [
                "الزيون:".bodyMedium(),
                const SizedBox(height: 5),
                "عدد المنتجات:".bodyMedium(),
                const SizedBox(height: 5),
                "اجمالي قيمة المنتجات:".bodyMedium(),
                const SizedBox(height: 5),
                "تاريخ الطلب:".bodyMedium(),
                const SizedBox(height: 5),
                "العنوان:".bodyMedium(),
                const SizedBox(height: 5),
                "الملاحظات:".bodyMedium(),
              ],
              subValues: [
                "هند اسامة".subtitle(color: Colors.black),
                const SizedBox(height: 5),
                "4".subtitle(color: Colors.black),
                const SizedBox(height: 5),
                "4".subtitle(color: Colors.black),
                const SizedBox(height: 5),
                "25-12-204".subtitle(color: Colors.black),
                const SizedBox(height: 5),
                "عرض".subtitle(
                  color: Constants.primary,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
