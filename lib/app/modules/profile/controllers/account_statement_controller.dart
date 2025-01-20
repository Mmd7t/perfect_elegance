import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/models/transactions_model/datum.dart';
import 'package:perfect_elegance/app/data/models/transactions_model/transactions_model.dart';
import 'package:perfect_elegance/app/modules/profile/providers/profile_provider.dart';

class AccountStatementController extends GetxController {
  final ProfileProvider provider = Get.find<ProfileProvider>();
  final ScrollController scrollController = ScrollController();

  RxBool isTransactionsLoading = false.obs;
  RxInt transactionsCurrentPage = 1.obs;
  RxInt transactionsLastPage = 1.obs;
  RxList<TransactionDatum> transactions = <TransactionDatum>[].obs;
  Future<void> getAccountStatement({bool isLoadMore = false}) async {
    isTransactionsLoading.value = true;
    final Map<String, dynamic>? data = await provider.getAccountStatements(
        page: transactionsCurrentPage.value);

    if (data != null) {
      isTransactionsLoading.value = false;
      if (data['code'] == 200) {
        TransactionsModel response = TransactionsModel.fromJson(data['data']);
        if (isLoadMore) {
          transactions
              .addAll(response.transactions!.data ?? <TransactionDatum>[]);
        } else {
          transactions.value =
              response.transactions!.data ?? <TransactionDatum>[];
        }
        transactionsCurrentPage.value = response.transactions!.currentPage ?? 1;
        transactionsLastPage.value = response.transactions!.lastPage ?? 1;
      }
    } else {
      isTransactionsLoading.value = false;
    }
  }

  bool get transactionsHasMore =>
      transactionsCurrentPage.value < transactionsLastPage.value;

  RxBool isLoadingMoreTransactions = false.obs;

  Future<void> fetchNextTransactions() async {
    if (transactionsHasMore && !isLoadingMoreTransactions.value) {
      isLoadingMoreTransactions.value = true;
      transactionsCurrentPage.value++;
      await getAccountStatement(isLoadMore: true);
      isLoadingMoreTransactions.value = false;
    }
  }

  @override
  void onReady() {
    getAccountStatement();
    super.onReady();
  }
}
