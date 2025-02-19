import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/transactions_model/datum.dart';
import 'package:perfect_elegance/app/modules/profile/controllers/account_statement_controller.dart';

class AccountStatementView extends GetView<AccountStatementController> {
  const AccountStatementView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.scrollController.addListener(() {
      if (controller.scrollController.position.pixels >=
              controller.scrollController.position.maxScrollExtent - 200 &&
          controller.transactionsHasMore &&
          !controller.isLoadingMoreTransactions.value) {
        controller.fetchNextTransactions();
      }
    });
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
        body: RefreshIndicator(
          backgroundColor: Get.theme.primaryColor,
          color: Colors.white,
          displacement: 0.0,
          onRefresh: () async {
            controller.transactions.value = <TransactionDatum>[];
            controller.transactionsCurrentPage.value = 1;
            controller.getAccountStatement();
          },
          child: Obx(() {
            final isLoading = controller.isTransactionsLoading.value;
            final transactions = controller.transactions;
            final hasMore = controller.transactionsHasMore;

            if (isLoading && transactions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else if (transactions.isEmpty) {
              return Center(
                child: 'لا يوجد كشوفات'.bodyMedium(),
              );
            } else {
              return ListView.separated(
                primary: false,
                physics: const BouncingScrollPhysics(),
                controller: controller.scrollController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemBuilder: (context, index) {
                  if (index < transactions.length) {
                    return DetailCard(
                      id: "رقم الايصال : ${transactions[index].id}",
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
                        (transactions[index].documentNumber ?? "--------")
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${transactions[index].type}"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${transactions[index].amount} د.ل"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${transactions[index].balance} د.ل"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        DateFormat("dd-MM-yyyy")
                            .format(transactions[index].createdAt!)
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        transactions[index].type == "withdrawal"
                            ? "خصم".subtitle(
                                color: Constants.cancel,
                                weight: FontWeight.bold,
                              )
                            : "قبض".subtitle(
                                color: Constants.success,
                                weight: FontWeight.bold,
                              ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemCount: transactions.length + (hasMore ? 1 : 0),
              );
            }
          }),
        ),
      ),
    );
  }
}
