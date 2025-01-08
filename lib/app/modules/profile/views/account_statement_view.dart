import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class AccountStatementView extends GetView {
  const AccountStatementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "كشف حساب"),
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
                  GlobalButton(
                    text: "التاريخ",
                    onTap: () {},
                    height: 40,
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
            id: "رقم الايصال : 151652626462",
            subtitles: [
              "رقم المستند:".bodyMedium(),
              const SizedBox(height: 5),
              "النوع:".bodyMedium(),
              const SizedBox(height: 5),
              "القيمة:".bodyMedium(),
              const SizedBox(height: 5),
              "الرصيد:".bodyMedium(),
              const SizedBox(height: 5),
              "تاريخ الانشاء:".bodyMedium(),
              const SizedBox(height: 5),
              "النوع:".bodyMedium(),
            ],
            subValues: [
              "5656562659689".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              "------------".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              "0 د.ل".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              "5000 د.ل".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              "25-12-204".subtitle(color: Colors.black),
              const SizedBox(height: 5),
              index == 0
                  ? "خصم".subtitle(
                      color: Constants.cancel,
                      weight: FontWeight.bold,
                    )
                  : "قبض".subtitle(
                      color: Constants.success,
                      weight: FontWeight.bold,
                    ),
            ],
          ),
          itemCount: 2,
        ),
      ),
    );
  }
}
