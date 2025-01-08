import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class ReturnsView extends GetView {
  const ReturnsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "المرتجعات"),
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
                  IconButton.filled(
                    onPressed: () {},
                    icon: "candle".iconColored(size: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemBuilder: (context, index) => DetailCard(
            id: "SKU : sk2309208554475741",
            subtitles: [
              "الاسم:".bodyMedium(),
              const SizedBox(height: 5),
              "سعر البيع:".bodyMedium(),
              const SizedBox(height: 5),
              "سعر الشراء:".bodyMedium(),
              const SizedBox(height: 5),
              "اللون:".bodyMedium(),
              const SizedBox(height: 5),
              "المقاس:".bodyMedium(),
            ],
            subValues: [
              "بدلة".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              "400\$".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              "400\$".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              "اسود".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              "xl".subtitle(color: Colors.black),
            ],
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
