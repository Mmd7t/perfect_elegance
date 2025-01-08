import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class AddRequestView extends StatelessWidget {
  const AddRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "إنشاء طلبية"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "بيانات الزبون".titleSmall(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: SearchCard(
                        text: "رقم الهاتف",
                        icon: "search",
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton.filled(
                      onPressed: () => Get.toNamed(Routes.addCustomer),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                "النتائج".subtitle(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "اسم الزيون:".bodyMedium(),
                          const SizedBox(height: 5),
                          "رقم الهاتف:".bodyMedium(),
                          const SizedBox(height: 5),
                          "المدينة:".bodyMedium(),
                          const SizedBox(height: 5),
                          "العنوان:".bodyMedium(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "هند اسامة".subtitle(color: Colors.black),
                          const SizedBox(height: 5),
                          Directionality(
                              textDirection: TextDirection.ltr,
                              child: "+20 1022 2322 22"
                                  .subtitle(color: Colors.black)),
                          const SizedBox(height: 5),
                          "طرابلس".subtitle(color: Colors.black),
                          const SizedBox(height: 5),
                          "------------".subtitle(color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ).decorate(padding: 15),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "بيانات الطلبية".titleSmall(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      child: SearchCard(
                        tag: 'sku search',
                        text: "البحث عن منتج - sku",
                        icon: "search",
                      ),
                    ),
                    const SizedBox(width: 5),
                    IconButton.filled(
                      onPressed: () => Get.toNamed(Routes.addNewProduct),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "النتائج".subtitle(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                        color: Constants.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: "SKU : sk2309208554475741"
                          .caption(color: Constants.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: "اسم المنتج:".bodyMedium(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: "بدلة التنورة".subtitle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: "المقاس:".bodyMedium(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: "xl".subtitle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: "اللون:".bodyMedium(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: "xl".subtitle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: "سعر الشراء:".bodyMedium(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: "0 د.ل".subtitle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: "سعر البيع:".bodyMedium(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: "0 د.ل".subtitle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: "الكمية:".bodyMedium(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: "4".subtitle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: "اجمالي الكمية:".bodyMedium(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: "0 د.ل".subtitle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: "الملاحظات:".bodyMedium(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Get.bottomSheet(
                              BottomSheet(
                                onClosing: () {},
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 10),
                                      "الملاحظات".titleSmall(),
                                      const SizedBox(height: 10),
                                      "وريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص،"
                                          .body(center: true),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: "عرض".subtitle(color: Get.theme.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).decorate(padding: 15),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GlobalButton(
          onTap: () {},
          text: "التالي",
        ),
      ),
    );
  }
}
