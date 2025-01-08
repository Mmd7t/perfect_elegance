import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

import '../controllers/customers_controller.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "الزبائن"),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: SearchCard(
                      text: "بحث..",
                      icon: "search",
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Get.theme.primaryColor,
                    ),
                    onPressed: () {},
                    icon: "candle".iconColored(size: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 16 / 12,
          ),
          itemBuilder: (context, index) => InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => Get.toNamed(Routes.customerDetails),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        "user".iconColored(size: 16),
                        const SizedBox(width: 8),
                        "هند أسامة".bodyMedium(),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        "phone".iconColored(size: 16),
                        const SizedBox(width: 8),
                        "+20 1022 2322 22".bodyMedium(),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        "location".iconColored(size: 16),
                        const SizedBox(width: 8),
                        "طرابلس".bodyMedium(),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        "package".iconColored(size: 16),
                        const SizedBox(width: 8),
                        "4".bodyMedium(),
                      ],
                    ),
                  ],
                ).decorate(padding: 12),
                PositionedDirectional(
                  end: 10,
                  top: 10,
                  child: "block".iconColored(),
                ),
              ],
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
