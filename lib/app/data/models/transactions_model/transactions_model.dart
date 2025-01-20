import 'transactions.dart';

class TransactionsModel {
  Transactions? transactions;

  TransactionsModel({this.transactions});

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      transactions: json['transactions'] == null
          ? null
          : Transactions.fromJson(json['transactions'] as Map<String, dynamic>),
    );
  }
}
